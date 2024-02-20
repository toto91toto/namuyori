defmodule NamuyoriWeb.UserLoginLive do
  use NamuyoriWeb, :live_view

  def render(assigns) do
    ~H"""
    <!-- Form -->
      <div class="container content-space-3 content-space-t-lg-4 content-space-b-lg-3">
      <div class="flex-grow-1 mx-auto" style="max-width: 28rem;">

        <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">


          <div class="mb-4">
            <.input field={@form[:email]} type="email" label="Your Email" required />
          </div>
          <div class="mb-4">
            <.input field={@form[:password]} type="password" label="Your Password" required />
          </div>



            <:actions>
              <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
              <.link href={~p"/users/reset_password"} class="text-sm font-semibold">
                Forgot your password?
              </.link>
            </:actions>
            <:actions>
            <div class="d-grid mb-3">
              <.button phx-disable-with="Signing in">
                Sign in
              </.button>
            </div>
              <div class="text-center">
                <p>Don't have an account yet?<.link navigate={~p"/users/register"} class="link">Sign up</.link></p>
              </div>
            </:actions>

        </.simple_form>
      </div>
    </div>
    <!-- End Form -->

    """
  end

  def mount(_params, _session, socket) do
    email = live_flash(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
