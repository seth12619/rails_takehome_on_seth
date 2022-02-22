# README

## Setup

- Ruby version 3.0.0
- `bundle install`
- `yarn install`
- `rails db:prepare`

Run dev server with `bin/dev`

---

## Take Home Tasks
Please answer all 5 tasks.

### Task 1.
Implement the `unique_names` method. When passed two arrays of names, it will return an array containing the names that appear in either or both arrays. The returned array should have no duplicates.

See `app/poros/task_1.rb`

### Task 2.
Implement a group_by_owners function that:
- Accepts a hash containing the file owner name for each file name.
- Returns a hash containing an array of file names for each owner name, in any order.

See `app/poros/task_2.rb`

### Task 3.
Select all statements that are correct after the following migration has been executed:
```
class ContactsMigration < ActiveRecord::Migration
  def change
    create table :contacts do |t|
      t.string :name
      t.integer :telephone_number
      t.text :address, null: false
      t.timestamps
    end
  end
end
```

Select all acceptable answers.
- [ ] The contacts.name field may be null.
- [ ] The contacts table has no index.
- [ ] The table called contacts contains four different data types.
- [ ] The table called contacts contains four different fields.
- [ ] The contacts.address field may be null.

### Task 4.
Consider the following controller and view definitions:

```
class RecordsController < ApplicationController
  def update
    @record = Record.find(params[:id])
    @record.update(record_params)
  end
end
```

```
<%= form_for record do |f| %>
  <%= render "form", f: f %>
<% end %>
```

Select the routing statements that can be used to update a record. Select all acceptable answers.
 - [ ] write /records/:id', to: 'records#update'
- [ ] put /records/:id', to: 'records#update'
- [ ] patch '/records/:id', to: 'records#update'
- [ ] post '/records/:id', to: 'records#update'
- [ ] resource :records, only: [:update]

### Task 5.
Consider that multiple models make use of the polymorphic :notable and move all the related implementation into a concern.

See `app/poros/task_5.rb`

### Task 6.
Activities are created over multiple steps:
**Step 1**: name [buttons back/next]
**Step 2**: address [buttons back/next]
**Step 3**: starts_at, ends_at [buttons back/save]

Update the activity model, controller and views to reflect this functionality. Every step should have its own form.

See `app/models/activity.rb`, `app/controllers/activities.rb` and `app/views/activities/**`# rails_takehome
