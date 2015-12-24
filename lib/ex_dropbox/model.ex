defmodule ExDropbox.Model.Metadata do
  defstruct contents: nil, is_dir: nil, path: nil, root: nil, size: "0 bytes"
end

defmodule ExDropbox.Model.Account do
  defstruct country: nil, display_name: nil, email: nil, name_details: nil,
            quota_info: nil
end
