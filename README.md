# resource_concern
Include this controller concern in a RESTful controller to automatically look up the object and store it in the variable named by the controller. It automatically applies to [:destroy, :edit, :show, :update].

If you want it to do the lookup for a different method, invoke get_resource in that method.

For example:
```
class PostController < ApplicationController
  include ResourceConcern

  def show
    # @post is automagically defined!
  end

  def author_view
    get_resource
    # @post is now defined
  end
end
```

