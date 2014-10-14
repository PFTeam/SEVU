module ApplicationHelper

  def title
    [t('app_name'), @title].compact.join(' | ')
  end

  def remote_if_xhr
    { remote: true, error: 'modal', modal: true, replace: true } if request.xhr?
  end
  def project_form_html_options
      {
        data: {
          target: dom_id(@proyecto),
          error: 'modal',
          modal: true,
          replace: true
        }.merge(remote_if_xhr || {})
      }
  end
  def necesidad_form_html_options
      {
        data: {
          target: dom_id(@necesidad),
          error: 'modal',
          modal: true,
          replace: true
        }.merge(remote_if_xhr || {})
      }
  end
  def asignacion_rol_form_html_options
      {
        data: {
	  target: dom_id(@asignacion_rol),
          error: 'modal',
          modal: true,
          replace: true
        }.merge(remote_if_xhr || {})
      }
  end
  def objetivo_general_form_html_options
      {
        data: {
          target: dom_id(@objetivo_general),
          error: 'modal',
          modal: true,
          replace: true
        }.merge(remote_if_xhr || {})
      }
  end
  def objetivo_especifico_form_html_options
      {
        data: {
          target: dom_id(@objetivo_especifico),
          error: 'modal',
          modal: true,
          replace: true
        }.merge(remote_if_xhr || {})
      }
  end
  def actividad_form_html_options
      {
        data: {
          target: dom_id(@actividad),
          error: 'modal',
          modal: true,
          replace: true
        }.merge(remote_if_xhr || {})
      }
  end

end

