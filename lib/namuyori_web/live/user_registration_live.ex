defmodule NamuyoriWeb.UserRegistrationLive do
  use NamuyoriWeb, :live_view

  alias Namuyori.Accounts
  alias Namuyori.Accounts.User

  def render(assigns) do
    ~H"""
        <!-- Form -->
          <div class="container content-space-3 content-space-t-lg-4 content-space-b-lg-3">
      <div class="flex-grow-1 mx-auto" style="max-width: 28rem;">

        <!-- Form -->
          <.simple_form
        for={@form}
        id="registration_form"
        phx-submit="save"
        phx-change="validate"
        phx-trigger-action={@trigger_submit}
        action={~p"/users/log_in?_action=registered"}
        method="post"
      >
        <.error :if={@check_errors}>
          Oops, something went wrong! Please check the errors below.
        </.error>

        <div class="mb-3">
          <.input field={@form[:email]} type="email" label="Email" required />
        </div>
        <div class="mb-3">
          <.input field={@form[:password]} type="password" label="Password" required />
        </div>



        <:actions>
          <div class="d-grid mb-3">
            <.button phx-disable-with="Creating account...">Create an account</.button>
          </div>

          <div class="text-center">
            <p>Already have an account?<.link navigate={~p"/users/log_in"} class="link">
            Sign in
          </.link></p>
          </div>
        </:actions>
      </.simple_form>
      </div>
    </div>
    <!-- End Form -->
    """
  end

  def mount(_params, _session, socket) do
    changeset = Accounts.change_user_registration(%User{})

    socket =
      socket
      |> assign(trigger_submit: false, check_errors: false)
      |> assign_form(changeset)

    {:ok, socket, temporary_assigns: [form: nil]}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &url(~p"/users/confirm/#{&1}")
          )

        changeset = Accounts.change_user_registration(user)
        {:noreply, socket |> assign(trigger_submit: true) |> assign_form(changeset)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, socket |> assign(check_errors: true) |> assign_form(changeset)}
    end
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset = Accounts.change_user_registration(%User{}, user_params)
    {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset, as: "user")

    if changeset.valid? do
      assign(socket, form: form, check_errors: false)
    else
      assign(socket, form: form)
    end
  end
end
