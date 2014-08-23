# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: 'div', class: 'control-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

 config.wrappers :vertical_input_group, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
   b.use :html5
   b.use :placeholder
   b.use :label, class: 'control-label'
    
   b.wrapper tag: 'div' do |ba|
     ba.wrapper tag: 'div', class: 'input-group col-sm-12' do |append|
       append.use :input, class: 'form-control'
     end
     ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
     ba.use :hint, wrap_with: { tag: 'p', class: 'help-block' }
   end
 end
  
 config.wrappers :horizontal_input_group, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
   b.use :html5
   b.use :placeholder
   b.use :label, class: 'col-sm-3 control-label'
    
   b.wrapper tag: 'div', class: 'col-sm-12' do |ba|
     ba.wrapper tag: 'div', class: 'input-group col-sm-12' do |append|
       append.use :input, class: 'form-control'
     end
     ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
     ba.use :hint, wrap_with: { tag: 'p', class: 'help-block' }
   end
 end

  config.wrappers :prepend, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :append, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
