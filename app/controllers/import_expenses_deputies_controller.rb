require 'csv'

class ImportExpensesDeputiesController < ApplicationController

  def import
    deputies_expenses = []
    deputies = []

    deputies_columns = [:name, :registration, :uf, :party]
    deputies_expenses_columns = [:deputy_registration, :description, :date, :establishment, :value, :link_receipt]

    ce_deputies_expenses = CSV.readlines(
      params[:file],
      encoding: "bom|utf-8",
      headers: :first_row,
      col_sep: ";"
    ).select { |row| row['sgUF'] == 'CE' }

    group_by_deputies_registration = ce_deputies_expenses.chunk{ |row| row['ideCadastro'] }.to_h

    group_by_deputies_registration.each do |registration_id, expenses|
      deputies << expenses[0].values_at('txNomeParlamentar','ideCadastro', 'sgUF', 'sgPartido')
      deputies_expenses << expenses.map{ |row| row.values_at('ideCadastro', 'txtDescricao', 'datEmissao', 'txtFornecedor', 'vlrLiquido', 'urlDocumento') }
    end

    ActiveRecord::Base.transaction do
      Deputy.import(deputies_columns, deputies, on_duplicate_key_ignore: true)
      DeputyExpense.import(deputies_expenses_columns, deputies_expenses.flatten(1))
    end

    redirect_to :root, status: :success, notice: "Dados importados com sucesso"
  rescue StandardError => e

    redirect_to :root, status: :unprocessable_entity, alert: "Ocorreu um erro ao importar os dados do arquivo."
  end
end
