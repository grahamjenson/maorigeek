#= require hamlcoffee
#= require_tree ./tpls
#= require_self

JST['settings/post'] =  JST['tpls/post_settings_menu']

Ghost.View.PostSettings.prototype.showUploadThumb = () ->
    self = this
    key = 'thumbnail'
    src = this.model.attributes.thumbnail
    upload = new Ghost.Models.uploadModal({
      'key': key, 
      'src': src, 
      'id': this.id, 
      'accept': {
        func: () ->
          data = {};
          if (this.$('.js-upload-url').val())
            data[key] = this.$('.js-upload-url').val()
          else
            data[key] = this.$('.js-upload-target').attr('src')
          
          self.model.save(data)
          return true
        buttonClass: "button-save right",
        text: "Save"
      }
    })
    upload.id = this.model.id
    @$("##{this.model.id}").data('filestorage',true)
    this.addSubview(new Ghost.Views.Modal({model: upload}));

Ghost.View.PostSettings.prototype.events['click .js-post-thumbnail'] = 'showUploadThumb'


