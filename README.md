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

# ownable_concern
This requires the use of the devise gem and ResourceConcern must be included directly above

ownable_concern forces the current_user to be the owner of an object for [:edit, :destroy, :update]. If you want it to apply to another method, invoke current_user_must_be_creator in that method.  

If you don't want it to apply to any of [:edit, :destroy, :update], write your own before_action.

```
class PostController < ApplicationController
  include ResourceConcern
  include OwnableConcern
  before_action [:edit, :update] # anyone can destroy!
  
  def show
    current_user_must_be_creator # Nobody but the creator of the object can access it!
  end
  
end
```
To make it work with the resource, you need to define the owner of the object.
```
alias :owner, :whatever_the_owner_is
```

It also accepts an "admin?" method on the user object to override ownership.
