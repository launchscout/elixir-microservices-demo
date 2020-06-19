defmodule AuthServer.Accounts do
  alias AuthServer.Repo
  alias __MODULE__.Account

  def get_or_register(%{info: %{email: email}} = params) do
    if account = get_by_email(email) do
      {:ok, account}
    else
      register(params)
    end
  end

  def register(%{provider: :identity} = params) do
    %Account{}
    |> Account.changeset(extract_account_params(params))
    |> Repo.insert()
  end

  def register(%{provider: :google} = params) do
    %Account{}
    |> Account.oauth_changeset(extract_account_params(params))
    |> Repo.insert()
  end

  def register(%{} = _params) do
    {:error, :invalid_params}
  end

  def get_account(id) do
    Repo.get(Account, id)
  end

  def get_by_email(email) do
    Repo.get_by(Account, email: email)
  end

  def update_account(account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  def change_account(account \\ %Account{}) do
    Account.changeset(account, %{})
  end

  defp extract_account_params(%{credentials: %{other: other}, info: info}) do
    info
    |> Map.from_struct()
    |> Map.merge(other)
  end
end
