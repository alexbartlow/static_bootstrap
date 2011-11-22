module Helpers
  module Links
    def li_link_to(name, path, options = {})
      %{<li class="#{'active' if path == request.path}">
          <a href="#{path}">#{name}</a>
        </li>}
    end
  end
end
