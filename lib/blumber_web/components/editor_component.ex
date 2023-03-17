defmodule BlumberWeb.EditorComponent do
  use Phoenix.Component
  use BlumberWeb, :html

  attr :initialValue, :string, default: ""

  def editor(assigns) do
    ~H"""
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js">
    </script>
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <div id="editor"></div>
    <script>
      const { Editor } = toastui;
      const editor = new Editor({
        el: document.querySelector('#editor'),
        initialEditType: 'markdown',
        previewStyle: 'vertical',
        height: '500px',
        initialValue: "<%= @initialValue %>",
        events: {
          change: () => {
            console.log(editor.getMarkdown());
          }
        }
      });
    </script>
    """
  end
end
