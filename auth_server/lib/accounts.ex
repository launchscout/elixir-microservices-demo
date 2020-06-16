defmodule AuthServer.Accounts do
  use GenServer
  alias AuthServer.Repo
  alias __MODULE__.Account

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: {:global, :accounts_server})
  end

  # Callbacks

  @impl true
  def init(_) do
    {:ok, []}
  end

  @impl true
  def handle_call({:get_or_register, params}, _from, state) do
    {:reply, get_or_register(params), state}
  end

  @impl true
  def handle_call({:register, params}, _from, state) do
    {:reply, register(params), state}
  end

  @impl true
  def handle_call({:get_account, id}, _from, state) do
    {:reply, get_account(id), state}
  end

  @impl true
  def handle_call({:get_by_email, email}, _from, state) do
    {:reply, get_by_email(email), state}
  end

  @impl true
  def handle_call(:get_account_cset, _from, state) do
    {:reply, change_account(), state}
  end

  # Business Logic

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

  def change_account(account \\ %Account{}) do
    Account.changeset(account, %{})
  end

  defp extract_account_params(%{credentials: %{other: other}, info: info}) do
    info
    |> Map.from_struct()
    |> Map.merge(other)
  end
end
