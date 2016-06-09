u = User.create(name: 'User', email: 'user@example.com', password: '123456' )
ContactCustomField.create(name: 'Mother name', field_type: 'text_field', user_id: u.id)
ContactCustomField.create(name: 'Summary', field_type: 'text_area', user_id: u.id)
Contact.create(name: 'Contact', email: 'contact@example.com', user_id: u.id)
