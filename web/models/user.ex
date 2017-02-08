require IEx;
defmodule AuthExample.User do
  use AuthExample.Web, :model

  schema "users" do
    field :email, :string
    field :crypted_password, :string
    field :password, :string, virtual: true
    timestamps()
  end

  @required_fields ~w(email password)
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> put_change(:crypted_password, Comeonin.Bcrypt.hashpwsalt(params[:password] || ""))
  end
end
