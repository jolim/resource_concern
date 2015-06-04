# resource_concern
Include this controller concern in a RESTful controller to automatically look up the object and store it in the variable named by the controller.

For example:
```
class PostController < ApplicationController
  include ResourceConcern
end
```

When you invoke create, edit, update or destroy, ResourceConcern will automatically create a variable called @post and look up the post.

If you want to get the resource for another method, for example:

In routes.rb
```
resources :posts do
  get :author_view
end
```
Then in the controller, use get_resource in the definition

In post_controller.rb:
```
def author_view
  get_resource
  # @post is now set so you can do something with it
end
```

ownable_concern forces the current_user to be the owner of an object  
```
alias :owner, :whatever_the_owner_is
```

It also accepts an "admin?" method on the user object to override ownership.
