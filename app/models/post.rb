class Post < ApplicationRecord
    class Post < ApplicationRecord
        has_one_attached :uploaded_image
      end
 <div class="mb-3">
<%= form.label "uploaded_image", :class => "form-label" %>
<%= form.file_field "uploaded_image", :accept => "image/png,image/jpg,image/jpeg,image/gif", :class => "form-control" %>
</div>
end
