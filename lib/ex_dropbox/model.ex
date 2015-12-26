defmodule ExDropbox.Model.Content do
  defstruct data: nil
end

defmodule ExDropbox.Model.Meta do
  defstruct data: nil
end

defmodule ExDropbox.Model.Response do
  defstruct content: ExDropbox.Model.Content.__struct__,
            meta: ExDropbox.Model.Meta.__struct__
end

defmodule ExDropbox.Model.Metadata do
  defstruct contents: nil, is_dir: nil, path: nil, root: nil, size: "0 bytes"
end

defmodule ExDropbox.Model.MetadataLink do
  defstruct read_only: false, bytes: 0, modified: nil, visibility: nil,
            mime_type: nil, in_dropbox: false, size: "0 bytes", path: nil,
            is_dir: false
end

defmodule ExDropbox.Model.Account do
  defstruct country: nil, display_name: nil, email: nil, name_details: nil,
            quota_info: nil
end
