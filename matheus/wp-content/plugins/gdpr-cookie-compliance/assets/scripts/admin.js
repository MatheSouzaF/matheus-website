/* ========================================================================
 * DOM-based Routing
 * Based on http://goo.gl/EUTi53 by Paul Irish
 *
 * Only fires on body classes that match. If a body class contains a dash,
 * replace the dash with an underscore when adding it to the object below.
 *
 * .noConflict()
 * The routing is enclosed within an anonymous function so that you can
 * always reference jQuery with $, even when in .noConflict() mode.
 * ======================================================================== */

(function($) {

  // Use this variable to set up the common and page specific functions. If you
  // rename this variable, you will also need to rename the namespace below.
  var GDPR_BE = {
    // All pages
    'common': {
      init: function() {
        $(document).on('click','.gdpr-help-content-cnt .gdpr-faq-toggle h3',function(){
          var parent = $(this).closest('.gdpr-faq-toggle');
          if ( parent.hasClass('gdpr-faq-open') ) {
            parent.removeClass('gdpr-faq-open').find('.gdpr-faq-accordion-content').slideUp(200);
          } else {
            parent.closest('.gdpr-help-content-block').find('.gdpr-faq-open').each(function(){
              $(this).find('.gdpr-faq-accordion-content').slideUp(200);
              $(this).removeClass('gdpr-faq-open');

            });
            parent.addClass('gdpr-faq-open').find('.gdpr-faq-accordion-content').slideDown(200);
          }
        });

        var total_checked     = 0;
        var current_checked   = 0;
        $(document).on('click','.licence-key-wrap button.gdpr-msba-bulk-activate',function(e){
          if ( $(this).closest('form').find('input[name=gdpr_msba_licence_key]').val().length > 5 ) {
            e.preventDefault();
            total_checked         = $(document).find('.gdpr-msba-wrap input.on-off:checked').length;
            var current_checked   = 0;
            if ( total_checked > 0 ) {
              var ajax_url      = $(this).closest('form').attr('data-ajax');
              var action        = $(this).closest('form').attr('action');       
              var nonce         = $('#gdpr_lt_nonce_bulk').val();      
              var licence_key   = $(this).closest('form').find('input[name=gdpr_msba_licence_key]').val();
              $('.msba-progress-bar').slideDown('slow');
              $('.gdpr-msba-wrap .wp-list-table tbody').find('input.on-off:checked').closest('tr').addClass('disabled');
              
              msba_activate_licence( ajax_url, licence_key, action, nonce );
            }
          }
        });

        function msba_activate_licence( ajax_url, licence_key, action, nonce ) {
          var ms_blog = $(document).find('.gdpr-msba-wrap input.on-off:checked').first();          
          if ( ms_blog.length > 0 ) {
            current_checked = current_checked + 1;
            $('.msba-progress-bar .msba-progress').css('width', ( ( current_checked * 100 ) / total_checked ) + '%');
            var blog_id = ms_blog.closest('td').attr('data-bid');
            $.post(
              ajax_url,
              {
                action: action,
                nonce: nonce,
                licence_key: licence_key,
                blog_id: blog_id
              },
              function( msg ) {                
                ms_blog.prop( 'checked',false );
                var obj = JSON.parse( msg );
                var error_label = 'Error';

                if ( obj.type === 'max_activation_reached' ) {
                  error_label = 'Activation limit reached';
                }
                ms_blog.closest('tr').removeClass('disabled');
                ms_blog.closest('tr').find('.msba-status').html( obj.valid ? '<span class="gdpr-admin-lbl gdpr-active">Active</span>' : '<span class="gdpr-admin-lbl gdpr-error">'+error_label+'</span>' );
                ms_blog.closest('tr').find('.msba-licence_k').html( licence_key );
                msba_activate_licence( ajax_url, licence_key, action, nonce );

                if ( total_checked === current_checked ) {
                  $('.msba-progress-bar .msba-progress').css('width', '0').parent().hide();
                }
              }
            );
          }
        }

        $(document).on('change','input[name=gdpr_msb_licence_activator_tool_all]',function(e){
          if ( $(this).is(':checked') ) {
            $(this).closest('table').find('input.on-off').prop('checked',true);
          } else {
            $(this).closest('table').find('input.on-off').prop('checked',false);
          }
        });

        $(document).on('change','input.on-off',function(e){
          if ( ! $(this).is(':checked') ) {
            $(this).closest('table').find('input[name=gdpr_msb_licence_activator_tool_all]').prop('checked',false);
          }
        });

        function update_gdpr_sortable_buttons_order( parent ) {
          var index = 0;
          var buttons_order = {};
          parent.find('.gdpr-sortable-button').each(function(){
            index++;
            var _this         = $(this);
            buttons_order[index] = $(this).attr('data-type');
          });
          parent.closest('.gdpr-sortable-buttons-wrap').find('.gdpr-buttons-order-inpval').val(JSON.stringify( buttons_order ) );
        }

        $('.gdpr-sortable-buttons').each(function(){
          try {
            $(this).sortable({
              items: ".gdpr-sortable-button:not(.ui-state-disabled)",
              connectWith: $(this),
              update: function(event, ui) {
                var parent = $(event.target).closest('.gdpr-sortable-buttons-wrap');
                update_gdpr_sortable_buttons_order(parent);
              }
            });
          } catch( e ) {

          }
        });

        var deactivation_started = false;

        var reset_started = false;

        var previous_sn = false;

        var $inputs = $('input[name=moove_gdpr_strictly_necessary_cookies_functionality]');
        $inputs.on('focus', function() {
          previous_sn = $inputs.filter(':checked');
        });


        $(document).on('change','input[name="moove_gdpr_strictly_necessary_cookies_functionality"]', function(e){
          if ( $(this).val() === '1' && $(this).closest('td').attr('data-fsm') === 'true' ) {
            e.preventDefault();
            previous_sn.prop('checked',true).focus();
            $('.gdpr-admin-popup.gdpr-admin-popup-fsm-settings').fadeIn(200);
          }
        });

        $(document).on('click','.button-reset-settings',function(e){
          e.preventDefault();
          $('.gdpr-admin-popup.gdpr-admin-popup-reset-settings').fadeIn(200);
        });
        
        $(document).on('click','.gdpr_deactivate_license_key',function(e){
          e.preventDefault();
          $('.gdpr-admin-popup.gdpr-admin-popup-deactivate').fadeIn(200);
        });

        $(document).on('click','.gdpr-admin-popup .gdpr-popup-overlay, .gdpr-admin-popup .gdpr-popup-close',function(e){
          e.preventDefault();
          $(this).closest('.gdpr-admin-popup').fadeOut(200);
        });

        $(document).on('click','.gdpr-admin-popup.gdpr-admin-popup-deactivate .button-deactivate-confirm',function(e){
          e.preventDefault();
          deactivation_started = true;
         
          $("<input type='hidden' value='1' />")
           .attr("id", "gdpr_deactivate_license")
           .attr("name", "gdpr_deactivate_license")
           .appendTo("#moove_gdpr_license_settings");
          $('#moove_gdpr_license_settings').submit();
          $('#moove_gdpr_license_key').val('');
          $(this).closest('.gdpr-admin-popup').fadeOut(200);
        });

        $(document).on('click','.gdpr-cookie-alert .gdpr-dismiss', function(e){
          e.preventDefault();
          $(this).closest('.gdpr-cookie-alert').slideUp(400);
          var ajax_url  = $(this).attr('data-adminajax');
          var user_id   = $(this).attr('data-uid');
          var nonce     = $(this).attr('data-nonce');
          console.warn(nonce);
          jQuery.post(
            ajax_url,
            {
              action: 'moove_hide_language_notice',
              user_id: user_id, 
              nonce: nonce,
            },
            function( msg ) {

            }
          );
        });


        $(document).on('click','.gdpr-cookie-update-alert .gdpr-dismiss-update', function(e){
          e.preventDefault();
          $(this).closest('.gdpr-cookie-alert').slideUp(400);
          var ajax_url  = $(this).attr('data-adminajax');
          var version   = $(this).attr('data-version');

          jQuery.post(
            ajax_url,
            {
              action: 'moove_hide_update_notice',
              version: version
            },
            function( msg ) {

            }
          );
        }); 

        $(document).on('click','a.gdpr-help-tab-toggle', function(e) {
          e.preventDefault();
          var target=$(this).attr('href');
          if ( $(target).length > 0 ) {
            $('.gdpr-help-content-block').slideUp();
            $(target).slideDown();
            $('.gdpr-help-tab-toggle').removeClass('active');
            var href = $(this).attr('href');
            $(document).find('a.gdpr-help-tab-toggle[href="'+href+'"]').addClass('active');
          }
          
        });

        $(document).on('click','.gdpr-script-tab-content .gdpr-tab-code-section-nav li > a ', function(e){
          e.preventDefault();
          var target = $(this).attr('href');
          $(this).closest('.gdpr-script-tab-content').find('.gdpr-active').removeClass('gdpr-active');
          $(this).addClass('gdpr-active');
          $(target).addClass('gdpr-active');
        });

        $(document).find('.gdpr-conditional-field').each(function(){
          var target = $(this).attr('data-dependency');
          // console.log($( target ));
          if ( $( target ).is(':checked') ) {
            $(this).addClass('gdpr-conditional-on');
          } else {
            $(this).removeClass('gdpr-conditional-on');
          }
        });

        $(document).on('change','.gdpr-checkbox-toggle input[type="checkbox"]',function(){
          if ( $(this).is(':checked') ) {
            $(document).find('.gdpr-conditional-field[data-dependency="#'+$(this).attr('id')+'"]').addClass('gdpr-conditional-on');
          } else {
            $(document).find('.gdpr-conditional-field[data-dependency="#'+$(this).attr('id')+'"]').removeClass('gdpr-conditional-on');
          }
        });

        if ( $('input[name="gdpr_close_button_bhv"]').length > 0 ) {
          if ( $('input[name="gdpr_close_button_bhv"]:checked').val() == 4 ) {
            $(document).find('#gdpr_close_button_bhv_redirect').show();
          } else {
            $(document).find('#gdpr_close_button_bhv_redirect').hide();
          }
        };

        $(document).on('change','input[name="gdpr_close_button_bhv"]',function(){
          if ( $('input[name="gdpr_close_button_bhv"]:checked').val() == 4 ) {
            $(document).find('#gdpr_close_button_bhv_redirect').show();
          } else {
            $(document).find('#gdpr_close_button_bhv_redirect').hide();
          }
        });



        if ( $('input[name="gdpr_reject_button_bhv"]').length > 0 ) {
          if ( $('input[name="gdpr_reject_button_bhv"]:checked').val() == 3 ) {
            $(document).find('.gdpr_reject_button_bhv_tbl').show();
          } else {
            $(document).find('.gdpr_reject_button_bhv_tbl').hide();
          }
        };

        $(document).on('change','input[name="gdpr_reject_button_bhv"]',function(){
          if ( $('input[name="gdpr_reject_button_bhv"]:checked').val() == 3 ) {
            $(document).find('.gdpr_reject_button_bhv_tbl').show();
          } else {
            $(document).find('.gdpr_reject_button_bhv_tbl').hide();
          }
        });

        if ( $('input[name="gdpr_reject_button_bhv_ss"]').length > 0 ) {
          if ( $('input[name="gdpr_reject_button_bhv_ss"]:checked').val() == 3 ) {
            $(document).find('.gdpr_reject_button_bhv_ss_tbl').show();
          } else {
            $(document).find('.gdpr_reject_button_bhv_ss_tbl').hide();
          }
        };

        $(document).on('change','input[name="gdpr_reject_button_bhv_ss"]',function(){
          if ( $('input[name="gdpr_reject_button_bhv_ss"]:checked').val() == 3 ) {
            $(document).find('.gdpr_reject_button_bhv_ss_tbl').show();
          } else {
            $(document).find('.gdpr_reject_button_bhv_ss_tbl').hide();
          }
        });


        // JavaScript to be fired on all pages
        $(document).on('keyup','input[name=moove_gdpr_company_logo]',function(){
          // console.log('changed');
          $('.moove_gdpr_company_logo_holder').css('background-image','url('+$(this).val()+')');
        });

        $(document).on('change','input[name="moove_gdpr_plugin_font_type"]',function(){
          if ( $(this).val() === '1' || $(this).val() === '2' ) {
            $('#moove_gdpr_plugin_font_family').addClass('moove-not-visible');
          } else {
            $('#moove_gdpr_plugin_font_family').removeClass('moove-not-visible');
          }
        })

        $('#moove_form_checker_wrap .iris-colorpicker').each(function(){
          $(this).iris({
            width: 300,
            hide: true,
            change: function(event, ui) {
             // event = standard jQuery event, produced by whichever control was changed.
             // ui = standard jQuery UI object, with a color member containing a Color.js object
              // change the headline color
             $(this).css( 'background', ui.color.toString());
            }

          }).on('click',function() {
            $(this).iris('toggle');
          });
          $(this).iris('color',$(this).val());
        });

        $(document).on('click','.iris-selectbtn',function(){
          $(this).parent().find('.iris-colorpicker').iris('toggle');
        });

        $(document).on('click','.iris-picker:visible', function() {
          $('.iris-colorpicker').iris('hide'); //click came from somewhere else
        });
      },
      finalize: function() {
        // JavaScript to be fired on all pages, after page specific JS is fired
      }
    },
    // Home page
    'home': {
      init: function() {
        // JavaScript to be fired on the home page
      },
      finalize: function() {
        // JavaScript to be fired on the home page, after the init JS
      }
    },
    // About us page, note the change from about-us to about_us.
    'about_us': {
      init: function() {
        // JavaScript to be fired on the about us page
      }
    }
  };

  // The routing fires all common scripts, followed by the page specific scripts.
  // Add additional events for more control over timing e.g. a finalize event
  var GDPR_UTIL_BE = {
    fire: function(func, funcname, args) {
      var fire;
      var namespace = GDPR_BE;
      funcname = (funcname === undefined) ? 'init' : funcname;
      fire = func !== '';
      fire = fire && namespace[func];
      fire = fire && typeof namespace[func][funcname] === 'function';

      if (fire) {
        namespace[func][funcname](args);
      }
    },
    loadEvents: function() {
      // Fire common init JS
      GDPR_UTIL_BE.fire('common');

      // Fire page-specific init JS, and then finalize JS
      $.each(document.body.className.replace(/-/g, '_').split(/\s+/), function(i, classnm) {
        GDPR_UTIL_BE.fire(classnm);
        GDPR_UTIL_BE.fire(classnm, 'finalize');
      });

      // Fire common finalize JS
      GDPR_UTIL_BE.fire('common', 'finalize');
    }
  };

  // Load Events
  $(document).ready(GDPR_UTIL_BE.loadEvents);

})(jQuery); // Fully reference jQuery after this point.
