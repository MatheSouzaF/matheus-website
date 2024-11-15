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
  var GDPR_FE = {
    // All pages
    'common': {
      init: function() {
        'use strict';
        var cookie_expiration = 365;
        var gdpr_cookies_loaded = [];
        var icons_loaded = false;
        if ( typeof moove_frontend_gdpr_scripts.cookie_expiration !== 'undefined' ) {
          cookie_expiration = moove_frontend_gdpr_scripts.cookie_expiration;
        }

        $(document).on('click','#moove_gdpr_cookie_modal .moove-gdpr-modal-content.moove_gdpr_modal_theme_v1 .main-modal-content .moove-gdpr-tab-main:not(#privacy_overview) .tab-title', function(e){
          if( window.innerWidth < 768 ) {
            if ( ! $(this).closest('.moove-gdpr-tab-main').find('.moove-gdpr-tab-main-content').is(':visible') ) {
              $(this).closest('.moove-gdpr-tab-main').find('.moove-gdpr-tab-main-content').slideDown(300);
            } else {
              $(this).closest('.moove-gdpr-tab-main').find('.moove-gdpr-tab-main-content').slideUp(300);
            }
          }
        });

        function gdpr_validate_url( string ) {
          var url;
          try {
            url = new URL( string );
          } catch (_) {
            return false;
          }
          return url.protocol === "http:" || url.protocol === "https:";
        }

        $(document).on('click tap','#moove_gdpr_cookie_info_bar .moove-gdpr-infobar-reject-btn, [href*="#gdpr-reject-cookies"], .moove-gdpr-modal-reject-all',function(e){
          e.preventDefault();
          gdpr_delete_all_cookies();
          gdpr_ajax_delete_cookies();

          if ( $('#moove_gdpr_cookie_info_bar').length > 0 ) {
            $('#moove_gdpr_cookie_info_bar').addClass('moove-gdpr-info-bar-hidden');
            $('body').removeClass('gdpr-infobar-visible');
            $('#moove_gdpr_cookie_info_bar').hide();
            $('#moove_gdpr_save_popup_settings_button').show();
          }

          $('.gdpr_lightbox .gdpr_lightbox-close').trigger('click');
          $(document).moove_gdpr_lightbox_close();

          if ( ( typeof moove_frontend_gdpr_scripts.gdpr_scor !== 'undefined' ) && moove_frontend_gdpr_scripts.gdpr_scor === 'false' )  {
          } else {
            moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: '0', advanced: '0'}),cookie_expiration);
            setTimeout(function(){
              moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: '0', advanced: '0'}),cookie_expiration);
            }, 500);
          }
          
          moove_gdpr_check_reload( 'reject-btn' );
        });
        var has_focus = false;
        var aos_default_enabled = false;

        function gdpr_find_next_tab_stop(el) {
          var universe = document.querySelectorAll('.gdpr-cc-form-fieldset');
          var list = Array.prototype.filter.call(universe, function(item) {return item.tabIndex >= "0"});
          var index = list.indexOf(el);
          return list[index + 1] || list[0];
        }
        var selected_menu_g   = $('.moove_gdpr_modal_theme_v2 .moove-gdpr-tab-main').first();
        var selected_menu_g_1 = $('.moove_gdpr_modal_theme_v2 .moove-gdpr-tab-main').first();
        var active_g = '';
        var gdpr_dynamic_focus_index   = 0;
        var gdpr_dynamic_focus_inforbar   = -1;

        var active_infobar = '';
        var is_shift = false;

        $(document).on('keydown', function(e) {
          // Keyboard accessibility only inside GDPR Popup
          if ( $('body').hasClass('moove_gdpr_overflow') && $('.moove-gdpr-modal-content').hasClass('moove_gdpr_modal_theme_v1') ) { 

            // Up arrow
            if ( e.keyCode == 38 ) {
              e.preventDefault();
              var selected_menu = $('#moove-gdpr-menu li.menu-item-selected');
              var prev = selected_menu.prev();
              if ( prev.length === 0 ) {
                prev = $('#moove-gdpr-menu li').last();
              }               
              prev.find('.moove-gdpr-tab-nav:visible').trigger('click');
              $('.moove-gdpr-tab-main:visible').trigger('focus');
            }

            // Down arrow
            if ( e.keyCode == 40 ) {
              e.preventDefault();
              if ( is_shift ) {
                var selected_menu = $('#moove-gdpr-menu li.menu-item-selected');
                var prev = selected_menu.prev();
                if ( prev.length === 0 ) {
                  prev = $('#moove-gdpr-menu li').last();
                }               
                prev.find('.moove-gdpr-tab-nav:visible').trigger('click');
                $('.moove-gdpr-tab-main:visible').trigger('focus');
              } else {
                var selected_menu = $('#moove-gdpr-menu li.menu-item-selected');
                var next = selected_menu.next();
                if ( next.length === 0 ) {
                  next = $('#moove-gdpr-menu li').first();
                }               
                next.find('.moove-gdpr-tab-nav:visible').trigger('click');
                $('.moove-gdpr-tab-main:visible').trigger('focus');
              }              
            }

            // Tab
            if ( e.keyCode == 9 ) {
              e.preventDefault();

              var items_to_focus = $('#moove_gdpr_cookie_modal .mgbutton, #moove_gdpr_cookie_modal .moove-gdpr-modal-close, #moove_gdpr_cookie_modal #moove-gdpr-menu > li');

              if ( items_to_focus.length > 0 ) {
                var item_to_focus = false;       
                
                if ( gdpr_dynamic_focus_index <= items_to_focus.length ) {
                  if ( is_shift ) {
                    gdpr_dynamic_focus_index--;
                  } else {
                    gdpr_dynamic_focus_index++;
                  }
                  item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                  
                  if ( ! $(item_to_focus).is(':visible') ) {
                    if ( is_shift ) {
                      gdpr_dynamic_focus_index--;
                    } else {
                      gdpr_dynamic_focus_index++;
                    }
                    item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                    
                  }
                } else {
                  gdpr_dynamic_focus_index = 0;
                  item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                }
                $('#moove_gdpr_cookie_modal .focus-g').removeClass('focus-g');
                if ( gdpr_dynamic_focus_index < 0 && is_shift ) {
                  gdpr_dynamic_focus_index = items_to_focus.length;
                }

                if ( ! item_to_focus && gdpr_dynamic_focus_index > items_to_focus.length ) {
                  gdpr_dynamic_focus_index = 0;
                  item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                }

                $(item_to_focus).addClass('focus-g').trigger('focus');
                if ( $(item_to_focus).hasClass('menu-item-on') || $(item_to_focus).hasClass('menu-item-off') ) {
                  $(item_to_focus).find('button').trigger('click');
                }

                if ( $(item_to_focus).length > 0 ) {
                  try {
                    $(item_to_focus)[0].scrollIntoViewIfNeeded();
                  } catch (error) {
                    console.warn(error);
                  }
                }
                
              } else {
                $('.cookie-switch').removeClass('focus-g');
              
                var next = selected_menu_g.next();
                selected_menu_g = next;
     
                if ( next.length === 0 ) {
                  next = selected_menu_g_1;
                  selected_menu_g = selected_menu_g_1;


                }               
                // next.find('.cookie-switch:visible').trigger('click');
                next.find('.cookie-switch').trigger('focus').addClass('focus-g');
                if ( next.find('.cookie-switch').length > 0 ) {
                  try {
                    next.find('.cookie-switch')[0].scrollIntoViewIfNeeded();
                  } catch (error) {
                    console.warn(error);
                  }
                }
              }
            }

            // Space key pressed - toggle checkboxes
            if( e.keyCode == 32 ) {
              e.preventDefault();
              var checkbox_element = $('.moove-gdpr-tab-main:visible').find('.moove-gdpr-status-bar input[type=checkbox]');
              checkbox_element.trigger('click');
            }

            // Enter key pressed - saving preferences
            if( e.keyCode == 13 ) {
              e.preventDefault();
              if ( $(document).find('.focus-g').length > 0 ) {
                $(document).find('.focus-g').trigger('click');
              } else {
                $('.moove-gdpr-modal-save-settings').trigger('click');
              }
            }
          } 

          if ( $('body').hasClass('moove_gdpr_overflow') && $('.moove-gdpr-modal-content').hasClass('moove_gdpr_modal_theme_v2') ) { 

            // Up arrow
            if ( e.keyCode == 38 ) {
              e.preventDefault();
              var selected_menu = $('#moove-gdpr-menu li.menu-item-selected');
              var prev = selected_menu.prev();
              if ( prev.length === 0 ) {
                prev = $('#moove-gdpr-menu li').last();
              }               
              prev.find('.moove-gdpr-tab-nav:visible').trigger('click');
              $('.moove-gdpr-tab-main:visible').trigger('focus');
            }

            // Down arrow
            if ( e.keyCode == 40 ) {
              e.preventDefault();
              var selected_menu = $('#moove-gdpr-menu li.menu-item-selected');
              var next = selected_menu.next();
              if ( next.length === 0 ) {
                next = $('#moove-gdpr-menu li').first();
              }               
              next.find('.moove-gdpr-tab-nav:visible').trigger('click');
              $('.moove-gdpr-tab-main:visible').trigger('focus');
            }

            // Space key pressed - toggle checkboxes
            if( e.keyCode == 32 ) {
              e.preventDefault();
              var fcs_element = $('#moove_gdpr_cookie_modal').find('.focus-g');
              fcs_element.trigger('click');
            }

            // Tab
            if ( e.keyCode == 9 ) {
              e.preventDefault();

              var items_to_focus = $('#moove_gdpr_cookie_modal .cookie-switch, #moove_gdpr_cookie_modal .mgbutton, #moove_gdpr_cookie_modal a:not(.moove-gdpr-branding), #moove_gdpr_cookie_modal .moove-gdpr-modal-close');

              if ( items_to_focus.length > 0 ) {
                var item_to_focus = false;       
                
                if ( gdpr_dynamic_focus_index <= items_to_focus.length ) {
                  if ( is_shift ) {
                    gdpr_dynamic_focus_index--;
                  } else {
                    gdpr_dynamic_focus_index++;
                  }
                  item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                  
                  if ( ! $(item_to_focus).is(':visible') ) {
                    if ( is_shift ) {
                      gdpr_dynamic_focus_index--;
                    } else {
                      gdpr_dynamic_focus_index++;
                    }
                    item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                    
                  }
                } else {
                  gdpr_dynamic_focus_index = 0;
                  item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                }
                $('#moove_gdpr_cookie_modal .focus-g').removeClass('focus-g');
                if ( gdpr_dynamic_focus_index < 0 && is_shift ) {
                  gdpr_dynamic_focus_index = items_to_focus.length;
                }

                if ( ! item_to_focus && gdpr_dynamic_focus_index > items_to_focus.length ) {
                  gdpr_dynamic_focus_index = 0;
                  item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                }

                $(item_to_focus).addClass('focus-g').trigger('focus');

                if ( $(item_to_focus).length > 0 ) {
                  try {
                    $(item_to_focus)[0].scrollIntoViewIfNeeded();
                  } catch (error) {
                    console.warn(error);
                  }
                }
                
              } else {
                $('.cookie-switch').removeClass('focus-g');
              
                var next = selected_menu_g.next();
                selected_menu_g = next;
     
                if ( next.length === 0 ) {
                  next = selected_menu_g_1;
                  selected_menu_g = selected_menu_g_1;


                }               
                // next.find('.cookie-switch:visible').trigger('click');
                next.find('.cookie-switch').trigger('focus').addClass('focus-g');
                if ( next.find('.cookie-switch').length > 0 ) {
                  try {
                    next.find('.cookie-switch')[0].scrollIntoViewIfNeeded();
                  } catch (error) {
                    console.warn(error);
                  }
                }
              }
            }

            // Enter key pressed - saving preferences
            if( e.keyCode == 13 ) {
              if ( $('#moove_gdpr_cookie_modal .focus-g').length > 0 && ( $('#moove_gdpr_cookie_modal .focus-g').hasClass('mgbutton') || $('#moove_gdpr_cookie_modal .focus-g').hasClass('moove-gdpr-modal-close') || $('#moove_gdpr_cookie_modal .focus-g').attr('href') ) ) {
                if ( $('#moove_gdpr_cookie_modal .focus-g').attr('href') ) {
                  $('#moove_gdpr_cookie_modal .focus-g').trigger('click');
                } else {
                  e.preventDefault();
                  $('#moove_gdpr_cookie_modal .focus-g').trigger('click');
                }
              } else {
                e.preventDefault();
                $('.moove-gdpr-modal-save-settings').trigger('click');
              }
            }
          } 
        });
       
        $(document).on('keyup', function(e) {
          if ( e.keyCode == 16 ) {
            is_shift = false;
          }

          if ( e.keyCode == 17 || e.keyCode == 18 || e.keyCode == 13 ) {
            is_shift = false;
          }
        });

        document.addEventListener('visibilitychange', function (event) {
          is_shift = false;
        });

        $(document).on('keydown', function(e) {
          if ( e.keyCode == 16 ) {
            is_shift = true;
          }

          if ( $('body').hasClass('gdpr-infobar-visible') && ! $('body').hasClass('moove_gdpr_overflow') && $('#moove_gdpr_cookie_info_bar').hasClass('gdpr-full-screen-infobar') ) {
            // Tab
            if ( e.keyCode == 9 ) {
              e.preventDefault();
              console.warn('fsw-tab');

              var items_to_focus = $('#moove_gdpr_cookie_info_bar.gdpr-full-screen-infobar span.change-settings-button, #moove_gdpr_cookie_info_bar.gdpr-full-screen-infobar button.change-settings-button, #moove_gdpr_cookie_info_bar.gdpr-full-screen-infobar [data-target="third_party_cookies"] label, #moove_gdpr_cookie_info_bar.gdpr-full-screen-infobar [data-target="advanced-cookies"] label, #moove_gdpr_cookie_info_bar.gdpr-full-screen-infobar .mgbutton');

              if ( items_to_focus.length > 0 ) {
                var item_to_focus = false;       
                
                if ( gdpr_dynamic_focus_index <= items_to_focus.length ) {
                  if ( is_shift ) {
                    gdpr_dynamic_focus_index--;
                  } else {
                    gdpr_dynamic_focus_index++;
                  }
                  item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                  
                  if ( ! $(item_to_focus).is(':visible') ) {
                    if ( is_shift ) {
                      gdpr_dynamic_focus_index--;
                    } else {
                      gdpr_dynamic_focus_index++;
                    }
                    item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                    
                  }
                } else {
                  gdpr_dynamic_focus_index = 0;
                  item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                }
                $('#moove_gdpr_cookie_info_bar .focus-g').removeClass('focus-g');
                if ( gdpr_dynamic_focus_index < 0 && is_shift ) {
                  gdpr_dynamic_focus_index = items_to_focus.length;
                }

                if ( ! item_to_focus && gdpr_dynamic_focus_index > items_to_focus.length ) {
                  gdpr_dynamic_focus_index = 0;
                  item_to_focus = items_to_focus[gdpr_dynamic_focus_index];
                }
                $(document).find('*').blur();
                $(item_to_focus).addClass('focus-g').trigger('focus');

                if ( $(item_to_focus).length > 0 ) {
                  try {
                    $(item_to_focus)[0].scrollIntoViewIfNeeded();
                  } catch (error) {
                    console.warn(error);
                  }
                }
                
              } else {
                $('.cookie-switch').removeClass('focus-g');
              
                var next = selected_menu_g.next();
                selected_menu_g = next;
     
                if ( next.length === 0 ) {
                  next = selected_menu_g_1;
                  selected_menu_g = selected_menu_g_1;


                }               
                // next.find('.cookie-switch:visible').trigger('click');
                next.find('.cookie-switch').trigger('focus').addClass('focus-g');
                if ( next.find('.cookie-switch').length > 0 ) {
                  try {
                    next.find('.cookie-switch')[0].scrollIntoViewIfNeeded();
                  } catch (error) {
                    console.warn(error);
                  }
                }
              }
            }

            if( e.keyCode == 32 ) {
              e.preventDefault();
              var checkbox_element = $('#moove_gdpr_cookie_info_bar').find('.gdpr-shr-switch.focus-g input[type=checkbox]');
              console.warn('space');
              checkbox_element.trigger('click');
            }
          }

          if( e.keyCode == 13 ) {
            if ( $(document.activeElement).length > 0 && $(document.activeElement).closest('#moove_gdpr_cookie_info_bar').length > 0 ) {
              e.preventDefault();
              $(document.activeElement).trigger('click');
            }
          }
          // }
        });

        function gdpr_cc_log( log ) {
          try {
            var urlParams = new URLSearchParams(window.location.search);
            if ( urlParams.has('gdpr_dbg') ) {
              console.warn( log );
            }
          } catch (e) {
            console.warn(e);
          }
        }
        
        $.fn.moove_gdpr_read_cookies = function(options){
          var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');
          var cookie_values = {};

          cookie_values['strict'] = '0';
          cookie_values['thirdparty'] = '0';
          cookie_values['advanced'] = '0';
          if ( cookies ) {
            cookies = JSON.parse( cookies );
            cookie_values['strict'] = parseInt(cookies.strict);
            cookie_values['thirdparty'] = parseInt(cookies.thirdparty);
            cookie_values['advanced'] = parseInt(cookies.advanced);
          }
          return cookie_values;

        }

        function gdpr_ajax_php_delete_cookies() {
          var ajax_cookie_removal = typeof moove_frontend_gdpr_scripts.ajax_cookie_removal !== 'undefined' ? moove_frontend_gdpr_scripts.ajax_cookie_removal : 'false';

          if ( ajax_cookie_removal === 'true' ) {
            $.post(
              moove_frontend_gdpr_scripts.ajaxurl,
              {
                action: "moove_gdpr_remove_php_cookies",
              },
              function( msg ) {
                gdpr_cc_log('dbg - cookies removed');
              }
            );
          }
        }

        function gdpr_ajax_delete_cookies() {
          gdpr_ajax_php_delete_cookies();
          var wp_lang = typeof moove_frontend_gdpr_scripts.wp_lang !== 'undefined' ? moove_frontend_gdpr_scripts.wp_lang : '';
          var ajax_cookie_removal = typeof moove_frontend_gdpr_scripts.ajax_cookie_removal !== 'undefined' ? moove_frontend_gdpr_scripts.ajax_cookie_removal : 'false';
          if ( ajax_cookie_removal === 'true' ) {
            $.post(
              moove_frontend_gdpr_scripts.ajaxurl,
              {
                action: "moove_gdpr_get_scripts",
                strict: 0,
                thirdparty: 0,
                advanced: 0,
                wp_lang: wp_lang,
              },
              function( msg ) {
                var cookie_values = {};

                cookie_values['strict'] = 1;
                cookie_values['thirdparty'] = 0;
                cookie_values['advanced'] = 0;
                gdpr_delete_all_cookies();
                
                gdpr_save_analytics( 'script_inject', cookie_values );
                moove_gdpr_change_switchers( cookie_values );
              }
            );
          } else {
            gdpr_delete_all_cookies();
          }
        }

        function gdpr_save_analytics( $options, $extras ) {
          try {
            jQuery().gdpr_cookie_compliance_analytics( $options, $extras );
          } catch(err) {
            // console.warn(err);
          }
        }

        function gdpr_save_consent_log( value ) {
          try {
            jQuery().gdpr_cookie_compliance_consent_log( value );
          } catch(err) {
            // console.warn(err);
          }
        }

        function m_g_read_cookies() {
          var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');
          var cookie_values = {};

          cookie_values['strict'] = '0';
          cookie_values['thirdparty'] = '0';
          cookie_values['advanced'] = '0';
          if ( cookies ) {
            cookies = JSON.parse( cookies );
            cookie_values['strict'] = cookies.strict;
            cookie_values['thirdparty'] = cookies.thirdparty;
            cookie_values['advanced'] = cookies.advanced;
            moove_gdpr_change_switchers( cookie_values );
            gdpr_save_analytics( 'script_inject', cookies );
          }

          if ( typeof moove_frontend_gdpr_scripts.ifbc !== 'undefined' ) {
            if ( moove_frontend_gdpr_scripts.ifbc === 'strict' && cookies && parseInt( cookies.strict ) === 1 ) {
              gdpr_remove_iframe_restrictions();
            }

            if ( moove_frontend_gdpr_scripts.ifbc === 'thirdparty' && cookies && parseInt( cookies.thirdparty ) === 1 ) {
              gdpr_remove_iframe_restrictions();
            }

            if ( moove_frontend_gdpr_scripts.ifbc === 'advanced' && cookies && parseInt( cookies.advanced ) === 1 ) {
              gdpr_remove_iframe_restrictions();
            }

          } else {
            if ( moove_frontend_gdpr_scripts.strict_init !== '1' ) {
              gdpr_remove_iframe_restrictions();
            }
          }
          return cookie_values;

        }

        function gdpr_remove_iframe_restrictions() {
          $(document).find("iframe[data-gdpr-iframesrc]").each(function(){
            $(this).attr('src',$(this).attr('data-gdpr-iframesrc'));
          });
        }

        var initial_cookies = m_g_read_cookies();
        var injected_scripts = false;
        var is_created = false;

        var modal_instance = '';
        var is_gdpr_lightbox = false;
        var consent_values = '';
        // JavaScript to be fired on all pages
        function moove_gdpr_save_cookies( $log ) {
          moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: '1', advanced: '1'}),cookie_expiration);
          moove_gdpr_check_reload( 'enabled-all' );
          gdpr_save_analytics( 'accept_all', '' );
        }   

        function moove_gdpr_check_reload( $log ) {
          var reload_page = false;
          // console.log($log);
          try {
            if ( typeof moove_frontend_gdpr_scripts.force_reload !== 'undefined' ) {
              if ( moove_frontend_gdpr_scripts.force_reload === 'true' ) {
                reload_page   = true;
              }
            }
          } catch(err) {
            // console.warn(err);
          }


          var current_cookies = m_g_read_cookies();

          var default_trirdparty = moove_frontend_gdpr_scripts.enabled_default.third_party;
          var default_advanced = moove_frontend_gdpr_scripts.enabled_default.advanced;

          var is_created = false;

          if ( ( document.cookie.indexOf("moove_gdpr_popup") >= 0 ) || ( default_trirdparty == 1 || default_advanced == 1 ) ) {
            var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');

            if ( default_trirdparty == 1 ) {
              initial_cookies.strict = 1;      
              initial_cookies.thirdparty = default_trirdparty;
            }
            if ( default_advanced == 1 ) {
              initial_cookies.strict = 1;              
              initial_cookies.advanced = default_advanced;
            }

            if ( initial_cookies ) {
              if ( parseInt(current_cookies.strict) - parseInt(initial_cookies.strict) < 0 ) {
                reload_page = true;
              }
              if ( parseInt(current_cookies.thirdparty) - parseInt(initial_cookies.thirdparty) < 0 ) {
                reload_page = true;
              }

              if ( parseInt(current_cookies.advanced) - parseInt(initial_cookies.advanced) < 0 ) {
                reload_page = true;
              }
            }

          }
          
          if ( reload_page ) {
            cookies = {
              "strict" : 0,
              "thirdparty" : 0,
              "advanced" : 0
            };
            gdpr_save_analytics( 'script_inject', cookies );
            
            if ( typeof moove_frontend_gdpr_scripts.scripts_defined !== 'undefined' ) {
              setTimeout(function(){
                location.reload(true);
              }, 800);
            } else {
              var _ga_script = $(document).find('script[src*="googletagmanager.com"]');

              if ( _ga_script.length > 0 ) {
                _ga_script.each(function(){
                  var _ga_src = $(this).attr('src');
                  if ( _ga_src && gdpr_validate_url( _ga_src ) ) {
                    var _ga_url_q = new URL(_ga_src);
                    var _ga_ID = _ga_url_q.searchParams.get("id");
                    if ( _ga_ID ) {
                      document.cookie = 'woocommerce_' + _ga_ID + '=true; expires=Thu, 31 Dec 1970 23:59:59 UTC; path=/';
                      window['ga-disable-' + _ga_ID] = true;
                    }
                    if ( window.gtag ) {
                      window.gtag('remove');
                    }
                    $(this).remove();
                  }
                });
              }
              var ajax_cookie_removal = typeof moove_frontend_gdpr_scripts.ajax_cookie_removal !== 'undefined' ? moove_frontend_gdpr_scripts.ajax_cookie_removal : 'true';

              if ( 'function' === typeof navigator.sendBeacon ) {
                if ( ajax_cookie_removal === 'true' ) {
                  var log_data = new FormData();
                  log_data.append('action', 'moove_gdpr_remove_php_cookies');
                  navigator.sendBeacon( moove_frontend_gdpr_scripts.ajaxurl, log_data );
                  location.reload(true);
                } else {
                  location.reload(true);
                }
              } else {
                if ( ajax_cookie_removal === 'true' ) {
                  $.post(
                    moove_frontend_gdpr_scripts.ajaxurl,
                    {
                      action: "moove_gdpr_remove_php_cookies",
                    },
                    function( msg ) {
                      location.reload(true);
                    }
                  ).fail(function(){
                     location.reload(true);
                  });
                } else {
                  location.reload(true);
                }
              }
            }                      
          } else {
            var cookies_to_load = moove_gdpr_read_cookie('moove_gdpr_popup');
            gdpr_cc_log('dbg - inject - 4');
            moove_gdpr_inject_scripts_on_load(cookies_to_load);
            moove_gdpr_hide_infobar();
            $('#moove_gdpr_save_popup_settings_button').show();
          }          
        }

        function moove_gdpr_change_switchers( cookies ) {
          // console.warn(cookies);
          if ( cookies ) {
            gdpr_save_analytics( 'script_inject', cookies );
            if ( parseInt( cookies.strict ) === 1 ) {
              if ( ! $('#moove_gdpr_strict_cookies').is(':checked') ) {
                // $('#moove_gdpr_strict_cookies').trigger('click'); // - 131022
                $('#moove_gdpr_strict_cookies').prop('checked', true).trigger('change'); // + 131022

                $('#third_party_cookies fieldset, #third_party_cookies .gdpr-cc-form-fieldset').removeClass('fl-disabled');
                $('#moove_gdpr_performance_cookies').prop('disabled',false);

                $('#third_party_cookies .moove-gdpr-strict-secondary-warning-message').slideUp();
                $('#advanced-cookies fieldset, #advanced-cookies .gdpr-cc-form-fieldset').removeClass('fl-disabled');
                $('#advanced-cookies .moove-gdpr-strict-secondary-warning-message').slideUp();
                $('#moove_gdpr_advanced_cookies').prop('disabled',false);
              }
              // WP Consent API
              if ( typeof moove_frontend_gdpr_scripts.wp_consent_api !== 'undefined' && 'true' === moove_frontend_gdpr_scripts.wp_consent_api ) {
                wp_set_consent('functional', 'allow');
                console.warn('functional allow');
              }
            } else {
              if ( $('#moove_gdpr_strict_cookies').is(':checked') ) {
                // $('#moove_gdpr_strict_cookies').trigger('click').prop('checked',true);  // - 131022
                $('#moove_gdpr_strict_cookies').prop('checked',true).trigger('change'); // + 131022

                $('#third_party_cookies fieldset, #third_party_cookies .gdpr-cc-form-fieldset').addClass('fl-disabled').closest('.moove-gdpr-status-bar').removeClass('checkbox-selected');
                $('#moove_gdpr_performance_cookies').prop('disabled',true).prop('checked',false);
               
                $('#advanced-cookies fieldset, #advanced-cookies .gdpr-cc-form-fieldset').addClass('fl-disabled').closest('.moove-gdpr-status-bar').removeClass('checkbox-selected');
                $('#moove_gdpr_advanced_cookies').prop('disabled',true).prop('checked',false);
              }
              // WP Consent API
              if ( typeof moove_frontend_gdpr_scripts.wp_consent_api !== 'undefined' && 'true' === moove_frontend_gdpr_scripts.wp_consent_api ) {
                wp_set_consent('functional', 'deny');
                console.warn('functional deny');
              }
            }

            if ( parseInt( cookies.thirdparty ) === 1 ) {
              if ( ! $('#moove_gdpr_performance_cookies').is(':checked') ) {
                // $('#moove_gdpr_performance_cookies').trigger('click'); // - 131022
                $('#moove_gdpr_performance_cookies').prop('checked', true).trigger('change'); // + 131022
              }

              // WP Consent API
              if ( typeof moove_frontend_gdpr_scripts.wp_consent_api !== 'undefined' && 'true' === moove_frontend_gdpr_scripts.wp_consent_api ) {
                wp_set_consent('statistics', 'allow');
                console.warn('statistics allow');
              }
            } else {
              if ( $('#moove_gdpr_performance_cookies').is(':checked') ) {
                // $('#moove_gdpr_performance_cookies').trigger('click'); // - 131022
                $('#moove_gdpr_performance_cookies').prop('checked', false).trigger('change'); // + 131022
              }

              // WP Consent API
                if ( typeof moove_frontend_gdpr_scripts.wp_consent_api !== 'undefined' && 'true' === moove_frontend_gdpr_scripts.wp_consent_api ) {
                  wp_set_consent('statistics', 'deny');
                  console.warn('statistics deny');
                }
            }
            if ( parseInt( cookies.advanced ) === 1 ) {
              if ( ! $('#moove_gdpr_advanced_cookies').is(':checked') ) {
                // $('#moove_gdpr_advanced_cookies').trigger('click'); // - 131022
                $('#moove_gdpr_advanced_cookies').prop('checked', true).trigger('change'); // + 131022
              }

              // WP Consent API
              if ( typeof moove_frontend_gdpr_scripts.wp_consent_api !== 'undefined' && 'true' === moove_frontend_gdpr_scripts.wp_consent_api ) {
                wp_set_consent('marketing', 'allow');
                console.warn('marketing allow');
              }
            } else {
              if ( $('#moove_gdpr_advanced_cookies').is(':checked') ) {
                // $('#moove_gdpr_advanced_cookies').trigger('click'); // - 131022
                $('#moove_gdpr_advanced_cookies').prop('checked', false).trigger('change'); // + 131022
              }

              // WP Consent API
              if ( typeof moove_frontend_gdpr_scripts.wp_consent_api !== 'undefined' && 'true' === moove_frontend_gdpr_scripts.wp_consent_api ) {
                wp_set_consent('marketing', 'deny');
                console.warn('marketing deny');
              }
            }
            $('input[data-name="moove_gdpr_performance_cookies"]').prop('checked',$('#moove_gdpr_performance_cookies').is(':checked'));
            $('input[data-name="moove_gdpr_strict_cookies"]').prop('checked',$('#moove_gdpr_strict_cookies').is(':checked'));
            $('input[data-name="moove_gdpr_advanced_cookies"]').prop('checked',$('#moove_gdpr_advanced_cookies').is(':checked'));
          }
        }

        function moove_gdpr_hide_infobar() {
          if ( $('#moove_gdpr_cookie_info_bar').length > 0 ) {
            $('#moove_gdpr_cookie_info_bar').addClass('moove-gdpr-info-bar-hidden');
            $('body').removeClass('gdpr-infobar-visible');
            $('#moove_gdpr_cookie_info_bar').hide();
          }
        }

        function moove_gdpr_show_infobar() {
          var show_infobar = true;
          if ( typeof( sessionStorage ) !== "undefined" && parseInt(sessionStorage.getItem( 'gdpr_infobar_hidden' )) === 1 ) {
            show_infobar = false;
          }

          if ( typeof moove_frontend_gdpr_scripts.display_cookie_banner !== 'undefined' && show_infobar ) {
            if ( moove_frontend_gdpr_scripts.display_cookie_banner === 'true' ) {
              if ( $('#moove_gdpr_cookie_info_bar').length > 0 ) {
                $('#moove_gdpr_cookie_info_bar').removeClass('moove-gdpr-info-bar-hidden');
                $('#moove_gdpr_save_popup_settings_button:not(.button-visible)').hide();
                $('body').addClass('gdpr-infobar-visible');
                $('#moove_gdpr_cookie_info_bar').show();
                gdpr_save_analytics( 'show_infobar', '' );
              }
            } else {
              if ( $('#moove_gdpr_cookie_info_bar').length > 0 ) {
                $('#moove_gdpr_cookie_info_bar').addClass('moove-gdpr-info-bar-hidden');
                $('body').removeClass('gdpr-infobar-visible');
                $('#moove_gdpr_cookie_info_bar').hide();
                var load_cookies = {
                  "strict" : 1,
                  "thirdparty" : 1,
                  "advanced" : 1
                };
                gdpr_cc_log('dbg - inject - 5');
                moove_gdpr_inject_scripts_on_load( JSON.stringify( load_cookies ) );
              }
            }
          } else {
            if ( $('#moove_gdpr_cookie_info_bar').length > 0 && show_infobar ) {
              $('#moove_gdpr_cookie_info_bar').removeClass('moove-gdpr-info-bar-hidden');
              $('#moove_gdpr_save_popup_settings_button:not(.button-visible)').hide();
              $('body').addClass('gdpr-infobar-visible');
              $('#moove_gdpr_cookie_info_bar').show();
              gdpr_save_analytics( 'show_infobar', '' );
            }
          }
        }

        $(document).on('click tap','#moove_gdpr_cookie_info_bar .moove-gdpr-infobar-close-btn', function(e) {
          e.preventDefault();
          
          if ( typeof moove_frontend_gdpr_scripts.close_btn_action !== 'undefined' ) {
            var close_btn_action = parseInt( moove_frontend_gdpr_scripts.close_btn_action );

            if ( close_btn_action === 1 ) {
              moove_gdpr_hide_infobar();
              $('#moove_gdpr_save_popup_settings_button').show();
              if ( typeof( sessionStorage ) !== "undefined" ) {
                sessionStorage.setItem( 'gdpr_infobar_hidden', 1 );
              }
            }

            if ( close_btn_action === 2 ) {
              gdpr_delete_all_cookies();
              gdpr_ajax_delete_cookies();

              if ( $('#moove_gdpr_cookie_info_bar').length > 0 ) {
                $('#moove_gdpr_cookie_info_bar').addClass('moove-gdpr-info-bar-hidden');
                $('body').removeClass('gdpr-infobar-visible');
                $('#moove_gdpr_cookie_info_bar').hide();
                $('#moove_gdpr_save_popup_settings_button').show();
              }

              $('.gdpr_lightbox .gdpr_lightbox-close').trigger('click');
              $(document).moove_gdpr_lightbox_close();

              if ( ( typeof moove_frontend_gdpr_scripts.gdpr_scor !== 'undefined' ) && moove_frontend_gdpr_scripts.gdpr_scor === 'false' )  {
              } else {
                moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: '0', advanced: '0'}),cookie_expiration);
                setTimeout(function(){
                  moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: '0', advanced: '0'}),cookie_expiration);
                }, 500);
              }
              
              moove_gdpr_check_reload( 'reject-btn' );
            }

            if ( close_btn_action === 3 ) {
              moove_gdpr_save_cookies( 'enable_all close-btn' );
            }

            // Close With Redirect
            if ( close_btn_action === 4 ) {
              gdpr_delete_all_cookies();
              gdpr_ajax_delete_cookies();

              if ( $('#moove_gdpr_cookie_info_bar').length > 0 ) {
                $('#moove_gdpr_cookie_info_bar').addClass('moove-gdpr-info-bar-hidden');
                $('body').removeClass('gdpr-infobar-visible');
                $('#moove_gdpr_cookie_info_bar').hide();
                $('#moove_gdpr_save_popup_settings_button').show();
              }

              $('.gdpr_lightbox .gdpr_lightbox-close').trigger('click');
              $(document).moove_gdpr_lightbox_close();

              if ( ( typeof moove_frontend_gdpr_scripts.gdpr_scor !== 'undefined' ) && moove_frontend_gdpr_scripts.gdpr_scor === 'false' )  {
              } else {
                moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: '0', advanced: '0'}),cookie_expiration);
                setTimeout(function(){
                  moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: '0', advanced: '0'}),cookie_expiration);
                }, 500);
              }

              if ( ( typeof moove_frontend_gdpr_scripts.close_btn_rdr !== 'undefined' ) && moove_frontend_gdpr_scripts.close_btn_rdr !== '' )  {
                window.parent.location.href = moove_frontend_gdpr_scripts.close_btn_rdr;
              } else {
                moove_gdpr_check_reload( 'reject-btn' );
              }
            }
          } else {
            moove_gdpr_hide_infobar();
            $('#moove_gdpr_save_popup_settings_button').show();
            if ( typeof( sessionStorage ) !== "undefined" ) {
              sessionStorage.setItem( 'gdpr_infobar_hidden', 1 );
            }
          }

        });

        function moove_gdpr_create_cookie(name, value, days) {

          var expires;
          if (days > 0) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toGMTString();
          } else {
            expires = "";
          }
          try {
            var cookie_attributes =  'SameSite=Lax';
            if ( typeof moove_frontend_gdpr_scripts.cookie_attributes !== 'undefined' ) {
              cookie_attributes = moove_frontend_gdpr_scripts.cookie_attributes;
            }
            if ( typeof moove_frontend_gdpr_scripts.gdpr_consent_version !== 'undefined' ) {
              value = JSON.parse( value );
              value.version = moove_frontend_gdpr_scripts.gdpr_consent_version;
              value = JSON.stringify( value );
            }

            if ( name === 'moove_gdpr_popup' ) {
              if ( parseInt( value.strict ) === 0 ) {
                if ( ( typeof moove_frontend_gdpr_scripts.gdpr_scor !== 'undefined' ) && moove_frontend_gdpr_scripts.gdpr_scor === 'false' )  {
                  document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/; " + cookie_attributes;
                } else {
                  document.cookie = encodeURIComponent(name) +'=; Path=/;';
                }
              } else {
                document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/; " + cookie_attributes;
              }
            } else {
              document.cookie = encodeURIComponent(name) + "=" + encodeURIComponent(value) + expires + "; path=/; " + cookie_attributes;
            }            
            if ( value !== consent_values ) {
              consent_values = value;
              gdpr_save_consent_log( value );
            }
          } catch(e) {
            gdpr_cc_log('error - moove_gdpr_create_cookie: ' + e);
          }
        }


        function moove_gdpr_read_cookie(name) {
          var nameEQ = encodeURIComponent(name) + "=";
          var ca = document.cookie.split(';');
          for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) === ' ') c = c.substring(1, c.length);
            if (c.indexOf(nameEQ) === 0) {
              var cookie_value  =  decodeURIComponent(c.substring(nameEQ.length, c.length));
              var cookie_json   = JSON.parse( cookie_value );
              if ( typeof cookie_json.version !== 'undefined' ) {
                if ( typeof moove_frontend_gdpr_scripts.gdpr_consent_version !== 'undefined' ) {
                  var current_ver = moove_frontend_gdpr_scripts.gdpr_consent_version;
                  if ( parseFloat( current_ver ) > parseFloat( cookie_json.version ) ) {
                    document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
                    return null;
                  }
                }
              } else {
                if ( typeof moove_frontend_gdpr_scripts.gdpr_consent_version !== 'undefined' && parseFloat( moove_frontend_gdpr_scripts.gdpr_consent_version ) > 1 ) {
                  document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
                  return null;
                }
              }
              return cookie_value;
            }
          }
          return null;
        }

        function moove_gdpr_check_append_html(el, str) {
          var div = document.createElement('div');
          div.innerHTML = str;
          while (div.children.length > 0) {
            el.appendChild(div.children[0]);
          }
        }

        function moove_gdpr_inject_scripts_on_load(cookies) {
          initial_cookies = m_g_read_cookies();
          if ( cookies ) {
            var cookie_input = cookies;
            cookies = JSON.parse( cookies );
            var cookies_json = m_g_read_cookies();       

            if ( injected_scripts !== false ) {
              var already_injected = JSON.parse( injected_scripts );

              if ( parseInt( already_injected.thirdparty ) === 1 && parseInt( cookies.thirdparty ) === 1 ) {
                cookies.thirdparty = '0';
              }

              if ( parseInt( already_injected.advanced ) === 1 && parseInt( cookies.advanced ) === 1 ) {
                cookies.advanced = '0';
              }

            }

            gdpr_save_analytics( 'script_inject', cookies );
            is_created = true;    
                   
            if ( typeof moove_frontend_gdpr_scripts.ifbc !== 'undefined' ) {
              if ( moove_frontend_gdpr_scripts.ifbc === 'strict' && cookies && parseInt( cookies.strict ) === 1 ) {
                gdpr_remove_iframe_restrictions();
              }

              if ( moove_frontend_gdpr_scripts.ifbc === 'thirdparty' && cookies && parseInt( cookies.thirdparty ) === 1 ) {
                gdpr_remove_iframe_restrictions();
              }

              if ( moove_frontend_gdpr_scripts.ifbc === 'advanced' && cookies && parseInt( cookies.advanced ) === 1 ) {
                gdpr_remove_iframe_restrictions();
              }

            } else {
              if ( parseInt( cookies.strict ) === 1 ) {
                gdpr_remove_iframe_restrictions();
              }
            }

            if ( typeof moove_frontend_gdpr_scripts.scripts_defined !== 'undefined' ) {
              try {
                var scripts_defined = JSON.parse( moove_frontend_gdpr_scripts.scripts_defined );

                if ( parseInt( cookies.strict ) === 1 ) {
                  if ( parseInt( cookies.thirdparty ) === 1 && typeof gdpr_cookies_loaded.thirdparty === 'undefined' ) {
                    if ( scripts_defined.thirdparty.header ) {
                      postscribe(document.head, scripts_defined.thirdparty.header);
                    }
                    if ( scripts_defined.thirdparty.body ) {
                      $(scripts_defined.thirdparty.body).prependTo(document.body);
                    }

                    if ( scripts_defined.thirdparty.footer ) {
                      postscribe(document.body, scripts_defined.thirdparty.footer);
                    }
                    gdpr_cookies_loaded.thirdparty = true;
                  } 
                  if ( parseInt( cookies.advanced ) === 1  && typeof gdpr_cookies_loaded.advanced === 'undefined' ) {
                    if ( scripts_defined.advanced.header ) {
                      postscribe(document.head, scripts_defined.advanced.header);
                    }
                    if ( scripts_defined.advanced.body ) {
                      $(scripts_defined.advanced.body).prependTo(document.body);
                    }
                    if ( scripts_defined.advanced.footer ) {
                      postscribe(document.body, scripts_defined.advanced.footer);
                    }
                    gdpr_cookies_loaded.advanced = true;
                  }
                } else {
                  var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');
                  if ( cookies ) {
                    gdpr_delete_all_cookies();
                    gdpr_ajax_delete_cookies();
                  }
                }
              } catch( e ) {
                // Error occurred
                console.error(e);
              }
              
            } else {
              if ( typeof gdpr_cookies_loaded.thirdparty === 'undefined' || typeof gdpr_cookies_loaded.advanced === 'undefined' ) {
                if ( cookies.thirdparty === 1 ) {
                  gdpr_cookies_loaded.thirdparty  = true;
                }
                if ( cookies.advanced === 1 ) {
                  gdpr_cookies_loaded.advanced    = true;
                }

                var wp_lang = typeof moove_frontend_gdpr_scripts.wp_lang !== 'undefined' ? moove_frontend_gdpr_scripts.wp_lang : '';
                
                if ( parseInt( cookies.thirdparty ) === 0 && parseInt( cookies.advanced ) === 0 ) {
                  gdpr_delete_all_cookies();
                }

                $.post(
                  moove_frontend_gdpr_scripts.ajaxurl,
                  {
                    action: "moove_gdpr_get_scripts",
                    strict: cookies.strict,
                    thirdparty: cookies.thirdparty,
                    advanced: cookies.advanced,
                    wp_lang: wp_lang,
                  },
                  function( msg ) {
                    injected_scripts = cookie_input;

                    gdpr_save_analytics( 'script_inject', cookies );

                    var obj = JSON.parse( msg );
                    if ( obj.header ) {
                      postscribe(document.head, obj.header);
                    }
                    if ( obj.body ) {
                      $(obj.body).prependTo(document.body);
                    }

                    if ( obj.footer ) {
                      postscribe(document.body, obj.footer);
                    }
                  }
                );
              }
            }
            
          } else {
            moove_gdpr_show_infobar();
          }
        }

        $.fn.moove_gdpr_save_cookie = function(options){
          
          var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');

          var cookie_input = cookies;
          
          var initial_scroll = $(window).scrollTop();

          if ( ! cookies ) {
            if ( options.thirdParty ) {
              var thirdparty = '1';
            } else {
              var thirdparty = '0';
            }

            if ( options.advanced ) {
              var advanced = '1';
            } else {
              var advanced = '0';
            }

            if ( options.scrollEnable ) {
              var scroll_offset = options.scrollEnable;
              $( window ).scroll(function() {
                if ( !is_created && ( $(this).scrollTop() - initial_scroll ) > scroll_offset ) {
                  if ( options.thirdparty !== 'undefined' || options.advanced !== 'undefined' ) {
                    moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: thirdparty, advanced: advanced}),cookie_expiration);
                    cookies = JSON.parse(cookies);
                    moove_gdpr_change_switchers(cookies);
                  }
                }
              });

            } else {
              if ( options.thirdparty !== 'undefined' || options.advanced !== 'undefined' ) {
                moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: thirdparty, advanced: advanced}),cookie_expiration);
                cookies = JSON.parse(cookies);
                moove_gdpr_change_switchers(cookies);
              }
            }
            cookies = moove_gdpr_read_cookie('moove_gdpr_popup');

            if ( cookies ) {
              cookies = JSON.parse( cookies );
              gdpr_save_analytics( 'script_inject', cookies );
              is_created = true;

              if ( typeof moove_frontend_gdpr_scripts.ifbc !== 'undefined' ) {
                if ( moove_frontend_gdpr_scripts.ifbc === 'strict' && cookies && parseInt( cookies.strict ) === 1 ) {
                  gdpr_remove_iframe_restrictions();
                }

                if ( moove_frontend_gdpr_scripts.ifbc === 'thirdparty' && cookies && parseInt( cookies.thirdparty ) === 1 ) {
                  gdpr_remove_iframe_restrictions();
                }

                if ( moove_frontend_gdpr_scripts.ifbc === 'advanced' && cookies && parseInt( cookies.advanced ) === 1 ) {
                  gdpr_remove_iframe_restrictions();
                }

              } else {
                if ( parseInt( cookies.strict ) === 1 ) {
                  gdpr_remove_iframe_restrictions();
                }
              }

              if ( typeof moove_frontend_gdpr_scripts.scripts_defined !== 'undefined' ) {
                try {
                  var scripts_defined = JSON.parse( moove_frontend_gdpr_scripts.scripts_defined );    

                  if ( parseInt( cookies.strict ) === 1 ) {
                    if ( parseInt( cookies.thirdparty ) === 1 && typeof gdpr_cookies_loaded.thirdparty === 'undefined' ) {
                      if ( scripts_defined.thirdparty.header ) {
                        postscribe(document.head, scripts_defined.thirdparty.header);
                      }
                      if ( scripts_defined.thirdparty.body ) {
                        $(scripts_defined.thirdparty.body).prependTo(document.body);
                      }

                      if ( scripts_defined.thirdparty.footer ) {
                        postscribe(document.body, scripts_defined.thirdparty.footer);
                      }
                      gdpr_cookies_loaded.thirdparty = true;
                    } 
                    if ( parseInt( cookies.advanced ) === 1  && typeof gdpr_cookies_loaded.advanced === 'undefined' ) {
                      if ( scripts_defined.advanced.header ) {
                        postscribe(document.head, scripts_defined.advanced.header);
                      }
                      if ( scripts_defined.advanced.body ) {
                        $(scripts_defined.advanced.body).prependTo(document.body);
                      }
                      if ( scripts_defined.advanced.footer ) {
                        postscribe(document.body, scripts_defined.advanced.footer);
                      }
                      gdpr_cookies_loaded.advanced = true;
                    }
                    // console.warn(cookies);
                  } else {
                    var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');
                    if ( cookies ) {
                      gdpr_delete_all_cookies();
                      gdpr_ajax_delete_cookies();
                    }
                  }
                } catch( e ) {
                  // Error occurred
                  console.error(e);
                }
                
              } else {
                if ( typeof gdpr_cookies_loaded.thirdparty === 'undefined' || typeof gdpr_cookies_loaded.advanced === 'undefined' ) {
                  if ( cookies.thirdparty === 1 ) {
                    gdpr_cookies_loaded.thirdparty  = true;
                  }
                  if ( cookies.advanced === 1 ) {
                    gdpr_cookies_loaded.advanced    = true;
                  }
                  
                  var wp_lang = typeof moove_frontend_gdpr_scripts.wp_lang !== 'undefined' ? moove_frontend_gdpr_scripts.wp_lang : '';
                  
                  if ( parseInt( cookies.thirdparty ) === 0 && parseInt( cookies.advanced ) === 0 ) {
                    gdpr_delete_all_cookies();
                  }

                  $.post(
                    moove_frontend_gdpr_scripts.ajaxurl,
                    {
                      action: "moove_gdpr_get_scripts",
                      strict: cookies.strict,
                      thirdparty: cookies.thirdparty,
                      advanced: cookies.advanced,
                      wp_lang : wp_lang,
                    },
                    function( msg ) {
                      injected_scripts = cookie_input;

                      gdpr_save_analytics( 'script_inject', cookies );
                      var obj = JSON.parse( msg );
                      if ( obj.header ) {
                        postscribe(document.head, obj.header);
                      }
                      if ( obj.body ) {
                        $(obj.body).prependTo(document.body);
                      }

                      if ( obj.footer ) {
                        postscribe(document.body, obj.footer);
                      }
                    }
                  );
                }
              }
            }
          }
        };

        function moove_gdpr_check_cookie(){
          var path = location.pathname;
          var initial_scroll = $(window).scrollTop();
          $('#moove_gdpr_save_popup_settings_button').show();
          var default_trirdparty = moove_frontend_gdpr_scripts.enabled_default.third_party;
          var default_advanced = moove_frontend_gdpr_scripts.enabled_default.advanced;

          if ( ( typeof moove_frontend_gdpr_scripts.enable_on_scroll !== 'undefined' ) && moove_frontend_gdpr_scripts.enable_on_scroll === 'true' ) {
            
            if ( parseInt( default_trirdparty ) !== 1 && parseInt( default_advanced ) !== 1 ) {
              default_trirdparty = 1;
              default_advanced = 1;
            }

          }

          if ( ( document.cookie.indexOf("moove_gdpr_popup") >= 0 ) || ( default_trirdparty == 1 || default_advanced == 1 ) ) {

            var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');
            if ( ! cookies ) {
              var gdpr_session = false;
              if ( typeof( sessionStorage ) !== "undefined" ) {
                gdpr_session = sessionStorage.getItem("gdpr_session");
              }


              if ( ( typeof moove_frontend_gdpr_scripts.enable_on_scroll !== 'undefined' ) && moove_frontend_gdpr_scripts.enable_on_scroll === 'true' ) {
                var scroll_offset = 200;
                if ( gdpr_session ) {
                  try {
                    moove_gdpr_change_switchers(JSON.parse( gdpr_session ) );                  
                    is_created = true;
                    gdpr_cc_log('dbg - inject - 1');
                    moove_gdpr_inject_scripts_on_load( gdpr_session );         
                    moove_gdpr_create_cookie( 'moove_gdpr_popup', gdpr_session, cookie_expiration );
                    moove_gdpr_hide_infobar();           
                  } catch(err) {
                    // console.warn(err);
                  }                         
                } else {
                  

                  // Loading default cookies
                  if ( ( !is_created && moove_frontend_gdpr_scripts.enabled_default.third_party == 1 ) || ( !is_created && moove_frontend_gdpr_scripts.enabled_default.advanced == 1 )  ) {
                    cookies = {
                      "strict" : 1,
                      "thirdparty" : default_trirdparty,
                      "advanced" : default_advanced
                    };
                    moove_gdpr_change_switchers(cookies);
                    cookies = JSON.stringify( cookies );
                    aos_default_enabled = true;
                    moove_gdpr_show_infobar();
                    gdpr_cc_log('dbg - default scroll inject');
                  }

                  // Enable on scroll
                  if ( ( typeof moove_frontend_gdpr_scripts.gdpr_aos_hide !== 'undefined' ) && ( moove_frontend_gdpr_scripts.gdpr_aos_hide === '1' || moove_frontend_gdpr_scripts.gdpr_aos_hide === 'true' || ( typeof moove_frontend_gdpr_scripts.gdpr_aos_hide === 'object' && moove_frontend_gdpr_scripts.gdpr_aos_hide.includes("1") ) ) ) {
                    // Scroll trigger
                    gdpr_cc_log('dbg - enable on scroll - enter');
                    $( window ).scroll(function() {
                      if ( ( !is_created || aos_default_enabled ) && ( $(this).scrollTop() - initial_scroll ) > scroll_offset ) {
                        cookies = {
                          "strict" : 1,
                          "thirdparty" : default_trirdparty,
                          "advanced" : default_advanced
                        };
                        var cookies_stored = moove_gdpr_read_cookie('moove_gdpr_popup');
                        if ( ! cookies_stored ) {
                          if ( typeof( sessionStorage ) !== "undefined" ) {
                            gdpr_session = sessionStorage.getItem("gdpr_session");
                            if ( ! gdpr_session ) {
                              sessionStorage.setItem( "gdpr_session", JSON.stringify( cookies ) );
                              gdpr_session = sessionStorage.getItem("gdpr_session");
                            }
                          }
                        }
                        try {
                          moove_gdpr_change_switchers(cookies);
                          cookies = JSON.stringify( cookies );
                          moove_gdpr_show_infobar();
                          is_created = true;
                          gdpr_cc_log('dbg - inject - 2 - accept on scroll');
                          if ( ! aos_default_enabled ) {
                            moove_gdpr_inject_scripts_on_load(cookies);
                          }
                          aos_default_enabled = false;
                          moove_gdpr_create_cookie('moove_gdpr_popup',cookies,cookie_expiration);
                          moove_gdpr_hide_infobar();
                          moove_gdpr_check_reload( 'check reload on scroll' );
                          $('#moove_gdpr_save_popup_settings_button').show();
                        } catch(err) {
                          // console.warn(err);
                        }                 
                      }                    
                    });

                  }
                  // Hidetimer
                  if ( ( typeof moove_frontend_gdpr_scripts.gdpr_aos_hide !== 'undefined' ) && ( moove_frontend_gdpr_scripts.gdpr_aos_hide === '2' || ( typeof moove_frontend_gdpr_scripts.gdpr_aos_hide === 'object' &&  moove_frontend_gdpr_scripts.gdpr_aos_hide.includes("2") ) ) ) {
                    var timeout = 30;
                    if ( ( typeof moove_frontend_gdpr_scripts.gdpr_aos_hide_seconds !== 'undefined' ) ) {
                      var timeout = parseInt( moove_frontend_gdpr_scripts.gdpr_aos_hide_seconds );
                    }

                    gdpr_cc_log( 'dbg - hidetimer - enter, seconds: ' + timeout );

                    setTimeout(
                      function () {
                        gdpr_cc_log( 'dbg - hidetimer - is_created: ' + is_created );
                        // Time trigger
                        if ( !is_created ) {
                          cookies = {
                            "strict" : 1,
                            "thirdparty" : default_trirdparty,
                            "advanced" : default_advanced
                          };
                          var cookies_stored = moove_gdpr_read_cookie('moove_gdpr_popup');

                          gdpr_cc_log( 'dbg - hidetimer - cookies_stored: ' + cookies_stored );

                          if ( ! cookies_stored ) {
                            if ( typeof( sessionStorage ) !== "undefined" ) {
                              gdpr_session = sessionStorage.getItem("gdpr_session");
                              if ( ! gdpr_session ) {
                                sessionStorage.setItem( "gdpr_session", JSON.stringify( cookies ) );
                                gdpr_session = sessionStorage.getItem("gdpr_session");
                              }
                            }
                          }
                          try {
                            moove_gdpr_change_switchers(cookies);
                            cookies = JSON.stringify( cookies );
                            moove_gdpr_show_infobar();
                            is_created = true;
                            gdpr_cc_log('dbg - inject - 2a');
                            moove_gdpr_inject_scripts_on_load(cookies);
                            moove_gdpr_create_cookie('moove_gdpr_popup',cookies,cookie_expiration);
                            moove_gdpr_check_reload( 'check reload hidetimer' );                            
                          } catch(err) {
                            // console.warn(err);
                          }                 
                        }
                        moove_gdpr_hide_infobar();
                        $('#moove_gdpr_save_popup_settings_button').show();
                      },
                      timeout * 1000
                    );                    
                  }
                  
                }
              } else {
                cookies = {
                  "strict" : 1,
                  "thirdparty" : default_trirdparty,
                  "advanced" : default_advanced
                };

                moove_gdpr_change_switchers(cookies);
                cookies = JSON.stringify( cookies );

                moove_gdpr_show_infobar();
              }

            } else {
              var cookies_json = m_g_read_cookies();
              
              if ( cookies_json.strict == '0' && cookies_json.advanced == '0' && cookies_json.thirdparty == '0' ) {                
                gdpr_delete_all_cookies();
                moove_gdpr_show_infobar();
              }
            }
            gdpr_cc_log('dbg - inject - 3');
            moove_gdpr_inject_scripts_on_load(cookies);
          } else {
            moove_gdpr_show_infobar();
          }
        }
        moove_gdpr_check_cookie();



        $(document).on('click','[data-href*="#moove_gdpr_cookie_modal"],[href*="#moove_gdpr_cookie_modal"]',function(e){
          e.preventDefault();
          if ( $('#moove_gdpr_cookie_modal').length > 0 ) {
            is_gdpr_lightbox = true;
            modal_instance = gdpr_lightbox('#moove_gdpr_cookie_modal');
            // $('#moove_gdpr_strict_cookies').trigger('click').trigger('click');
            $('.gdpr_lightbox').addClass('moove_gdpr_cookie_modal_open');
            $(document).moove_gdpr_lightbox_open();
            gdpr_save_analytics( 'opened_modal_from_link', '' );
          }
        });

        $(document).on('click','[data-href*="#gdpr_cookie_modal"],[href*="#gdpr_cookie_modal"]',function(e){
          e.preventDefault();
          if ( $('#moove_gdpr_cookie_modal').length > 0 ) {
            is_gdpr_lightbox = true;
            modal_instance = gdpr_lightbox('#moove_gdpr_cookie_modal');
            // $('#moove_gdpr_strict_cookies').trigger('click').trigger('click');
            $('.gdpr_lightbox').addClass('moove_gdpr_cookie_modal_open');
            $(document).moove_gdpr_lightbox_open();
            gdpr_save_analytics( 'opened_modal_from_link', '' );
          }
        });



        function check_allow_button() {
          var hide_button = true;
          $(document).find('#moove_gdpr_cookie_modal input[type=checkbox]').each(function(){
            var checkbox = $(this);
            if ( ! checkbox.is(':checked') ) {
              hide_button = false;
            }
          });
        }

        $(document).on('click tap','#moove_gdpr_cookie_info_bar .moove-gdpr-close-modal-button a, #moove_gdpr_cookie_info_bar .moove-gdpr-close-modal-button button',function(e){
          e.preventDefault();
          // moove_gdpr_hide_infobar();
        });
        $(document).on('click tap','.moove-gdpr-modal-close',function(e){
          e.preventDefault();
          $('.gdpr_lightbox .gdpr_lightbox-close').trigger('click');
          $(document).moove_gdpr_lightbox_close();
        });

        $(document).on('click','#moove-gdpr-menu .moove-gdpr-tab-nav', function(e){
          e.preventDefault();
          e.stopPropagation();
          $('#moove-gdpr-menu li').removeClass('menu-item-selected');
          $(this).parent().addClass('menu-item-selected');
          $('.moove-gdpr-tab-content .moove-gdpr-tab-main').hide();
          $( $(this).attr('href') ).show();
          $( $(this).attr('data-href') ).show();

          gdpr_save_analytics( 'clicked_to_tab', $(this).attr('data-href') );

        });
        $(document).on('gdpr_lightbox:close', function(event, instance) {
           $(document).moove_gdpr_lightbox_close();
        });
        $.fn.moove_gdpr_lightbox_close = function(options){
          if ( is_gdpr_lightbox ) {
            $('body').removeClass('moove_gdpr_overflow');
            is_gdpr_lightbox = false;
          }
        }
        $.fn.moove_gdpr_lightbox_open = function(options){
          if ( is_gdpr_lightbox ) {
            $('body').addClass('moove_gdpr_overflow');
            var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');
            document.activeElement.blur();
   
            if ( moove_frontend_gdpr_scripts.show_icons === 'none' ) {
              $('body').addClass('gdpr-no-icons');
            }
            $('.moove-gdpr-status-bar input[type=checkbox]').each(function(){
              if ( ! $(this).is(':checked') ) {
                $(this).closest('.moove-gdpr-tab-main').find('.moove-gdpr-strict-warning-message').slideDown();
              } else {
                $(this).closest('.moove-gdpr-tab-main').find('.moove-gdpr-strict-warning-message').slideUp();
              }
            });


            if ( cookies ) {
              cookies = JSON.parse(cookies);

              moove_gdpr_change_switchers(cookies);
            } else {
              if ( ! $('#moove_gdpr_strict_cookies').is(':checked') ) {
                $('#advanced-cookies .gdpr-cc-form-fieldset').addClass( 'fl-disabled' );
                $('#third_party_cookies .gdpr-cc-form-fieldset').addClass( 'fl-disabled' );
              }
            }
            if ( typeof moove_frontend_gdpr_scripts.hide_save_btn !== 'undefined' && moove_frontend_gdpr_scripts.hide_save_btn === 'true' ) {
              $('.moove-gdpr-modal-save-settings').removeClass('button-visible').hide();
            } else {
              $('.moove-gdpr-modal-save-settings').addClass('button-visible').show();
            }

            
            check_allow_button();
          }
        };

        $(document).on('gdpr_lightbox:open', function(event, instance) {
           $(document).moove_gdpr_lightbox_open();
        });
        $(document).on('click tap','.fl-disabled',function(e){
          if ( $('#moove_gdpr_cookie_modal .moove-gdpr-modal-content').is('.moove_gdpr_modal_theme_v2') ) {
            if ( $('#moove_gdpr_strict_cookies').length > 0 ) {
              $('#moove_gdpr_strict_cookies').trigger('click');
              $(this).trigger('click');
            }
          } else {
            $(this).closest('.moove-gdpr-tab-main-content').find('.moove-gdpr-strict-secondary-warning-message').slideDown();
          }
        });

        $(document).on('change','.moove-gdpr-status-bar input[type=checkbox]',function(e){
          $('.moove-gdpr-modal-save-settings').addClass('button-visible').show();
          var box_id = $(this).closest('.moove-gdpr-tab-main').attr('id');
          $(this).closest('.moove-gdpr-status-bar').toggleClass('checkbox-selected');
          $(this).closest('.moove-gdpr-tab-main').toggleClass('checkbox-selected');
          $('#moove-gdpr-menu .menu-item-' + box_id).toggleClass('menu-item-off');

          if ( ! $(this).is(':checked') ) {
            $(this).closest('.moove-gdpr-tab-main').find('.moove-gdpr-strict-warning-message').slideDown();
          } else {
            $(this).closest('.moove-gdpr-tab-main').find('.moove-gdpr-strict-warning-message').slideUp();
          }
          if ( $(this).is('#moove_gdpr_strict_cookies') ) {

            if ( $(this).is(':checked') ) {
              $('#third_party_cookies fieldset, #third_party_cookies .gdpr-cc-form-fieldset').removeClass('fl-disabled');
              $('#moove_gdpr_performance_cookies').prop('disabled',false);
              
              $('#third_party_cookies .moove-gdpr-strict-secondary-warning-message').slideUp();

              $('#advanced-cookies fieldset, #advanced-cookies .gdpr-cc-form-fieldset').removeClass('fl-disabled');
              $('#advanced-cookies .moove-gdpr-strict-secondary-warning-message').slideUp();
              $('#moove_gdpr_advanced_cookies').prop('disabled',false);
              

            } else {

              $('.gdpr_cookie_settings_shortcode_content').find('input').each(function(){
                $(this).prop('checked',false);
              });

              $('#third_party_cookies fieldset, #third_party_cookies .gdpr-cc-form-fieldset').addClass('fl-disabled').closest('.moove-gdpr-status-bar').removeClass('checkbox-selected');
              $('#moove_gdpr_performance_cookies').prop('disabled',true).prop('checked',false);
              
              $('#advanced-cookies fieldset, #advanced-cookies .gdpr-cc-form-fieldset').addClass('fl-disabled').closest('.moove-gdpr-status-bar').removeClass('checkbox-selected');
              
              $('#moove_gdpr_advanced_cookies').prop('disabled',true).prop('checked',false);

            }
          }

          $('input[data-name="'+$(this).attr('name')+'"]').prop('checked',$(this).is(':checked'));

          check_allow_button();
        });

        $(document).on('click tap','.gdpr_cookie_settings_shortcode_content a.gdpr-shr-save-settings',function(e){
          e.preventDefault();
          save_cookies( true );
          $('.gdpr_lightbox .gdpr_lightbox-close').trigger('click');
          $(document).moove_gdpr_lightbox_close();
          moove_gdpr_check_reload( 'modal-save-settings' );
        })
        $(document).on('change','.gdpr_cookie_settings_shortcode_content input[type=checkbox]',function(e){
          var target = $(this).attr('data-name');
          var t_cb = $('#'+target);
          if ( $(this).is(':checked') ) {
            $('input[data-name="'+target+'"]').prop('checked',true);           
            if ( $(this).attr('data-name') !== 'moove_gdpr_strict_cookies' ) {
              if ( ! $(this).closest('.gdpr_cookie_settings_shortcode_content').find('input[data-name="moove_gdpr_strict_cookies"]').is(':checked') ) {
                $('input[data-name="'+target+'"]').prop('checked',false);
                $('.gdpr_cookie_settings_shortcode_content input[data-name="moove_gdpr_strict_cookies"]').closest('.gdpr-shr-switch').css('transform', 'scale(1.2)');
                setTimeout(function(){
                  $('.gdpr_cookie_settings_shortcode_content input[data-name="moove_gdpr_strict_cookies"]').closest('.gdpr-shr-switch').css('transform', 'scale(1)');
                },300);
              }
            }
          } else {  
            $('input[data-name="'+target+'"]').prop('checked',$(this).is(':checked'));
            if ( $(this).attr('data-name') === 'moove_gdpr_strict_cookies' ) {
              $('.gdpr_cookie_settings_shortcode_content').find('input[type="checkbox"]').prop('checked',false);
            }
          }
          t_cb.trigger('click');
        });


        $(document).on('click tap','.moove-gdpr-modal-allow-all, [href*="#gdpr-accept-cookies"]',function(e){
          e.preventDefault();
          $('#moove_gdpr_cookie_modal').find('input[type=checkbox]').each(function(){
            var checkbox = $(this);
            if ( ! checkbox.is(':checked') ) {
              checkbox.trigger('click');
            }            
          });
          moove_gdpr_save_cookies( 'enable_all enable-all-button' );
          $('.gdpr_lightbox .gdpr_lightbox-close').trigger('click');
          moove_gdpr_hide_infobar();
          save_cookies( false );
          $(document).moove_gdpr_lightbox_close();
        });

        $(document).on('click tap','.moove-gdpr-infobar-allow-all',function(e){
          e.preventDefault();
          $('#moove_gdpr_cookie_modal').find('input[type=checkbox]').each(function(){
            var checkbox = $(this);
            if ( ! checkbox.is(':checked') ) {
              checkbox.trigger('click');
            }            
          });
          moove_gdpr_save_cookies( 'enable_all allow-btn' );
          $('.gdpr_lightbox .gdpr_lightbox-close').trigger('click');
          moove_gdpr_hide_infobar();
          save_cookies( false );          
        });

        $(document).on('click tap','.moove-gdpr-modal-save-settings',function(e){
          e.preventDefault();          
          save_cookies( true );
          $('.gdpr_lightbox .gdpr_lightbox-close').trigger('click');
          $(document).moove_gdpr_lightbox_close();
          moove_gdpr_check_reload( 'modal-save-settings' );

        });

        var delete_cookie = function(name) {
          try {
            $(document).find('script[data-gdpr]').each(function() {
              gdpr_cc_log( 'script_removed: ' + $(this).attr('src') );
              $(this).remove();
            });
            if ( ! name.includes('woocommerce') && ! name.includes('wc_') && ! name.includes('moove_gdpr_popup') && ! name.includes('wordpress') ) {
              document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;SameSite=Lax';
            }
          } catch(e) {
            gdpr_cc_log( 'error in delete_cookie: ' + e );
          }
        };

        function gdpr_delete_all_cookies( type ) {         
          try {
            $(document).find('script[data-gdpr]').each(function() {
              gdpr_cc_log( 'script_removed: ' + $(this).attr('src') );
            });
            var cookies = document.cookie.split(";");
            var domain  = window.location.hostname;
            for (var i = 0; i < cookies.length; i++) {
              var cookie = cookies[i];
              var eqPos = cookie.indexOf("=");
              var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
              if ( ! name.includes('woocommerce') && ! name.includes('wc_') && ! name.includes('moove_gdpr_popup') && ! name.includes('wordpress') ) {
                document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT;domain=" + domain;
                document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT;domain=." + domain;
                gdpr_cc_log('cookie removed: ' + name + ' - ' + domain);
              }
            }
          } catch(e) {
            gdpr_cc_log( 'error in gdpr_delete_all_cookies: ' + e );
          }
          if ( typeof( sessionStorage ) !== "undefined" ) {
            sessionStorage.removeItem("gdpr_session");
          }
        }

        function save_cookies( _delete_cookies ) {
          var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');

          if ( _delete_cookies ) {
            gdpr_delete_all_cookies();
            gdpr_ajax_php_delete_cookies();
          }

          var strict      = '0';
          var advanced    = '0';
          var thirdparty  = '0';
          var has_checked = false;
          if ( cookies ) {
            cookies     = JSON.parse( cookies );
            strict      = cookies.strict;
            advanced    = cookies.advanced;
            thirdparty  = cookies.thirdparty;
          }
          if ( $('#moove_gdpr_strict_cookies').length > 0 ) {
            // STRICT PARTY COOKIES
            if ( $('#moove_gdpr_strict_cookies').is(':checked') ) {
              strict = '1';
              has_checked = true;
            } else {
              strict = '0';
            }
          } else {
            has_checked = true;
            strict = '1';
          }

          // THIRD PARTY COOKIES
          if ( $('#moove_gdpr_performance_cookies').is(':checked') ) {
            thirdparty = '1';
            has_checked = true;
          } else {
            thirdparty = '0';
          }

          // ADVANCED PARTY COOKIES
          if ( $('#moove_gdpr_advanced_cookies').is(':checked') ) {
            advanced = '1';
            has_checked = true;
          } else {
            advanced = '0';
          }

          if ( ! cookies && has_checked ) {
            moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: strict, thirdparty: thirdparty, advanced: advanced}),cookie_expiration);
            moove_gdpr_hide_infobar();
            $('#moove_gdpr_save_popup_settings_button').show();
          } else {
            if ( cookies ) {
              moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: strict, thirdparty: thirdparty, advanced: advanced}),cookie_expiration);
            }
          }
          var cookies = moove_gdpr_read_cookie('moove_gdpr_popup');

          if ( cookies ) {
            cookies = JSON.parse( cookies );

            if ( cookies.strict == '0' && cookies.advanced == '0' && cookies.thirdparty == '0' ) {
              gdpr_delete_all_cookies();
            }
          }

        }

        
        if(window.location.hash) {
          var hash = window.location.hash.substring(1); //Puts hash in variable, and removes the # character
          hash = hash.replace(/\/$/, '');
          if ( hash === 'moove_gdpr_cookie_modal' || hash === 'gdpr_cookie_modal' ) {
            is_gdpr_lightbox = true;
            gdpr_save_analytics( 'opened_modal_from_link', '' );
            setTimeout(function(){
              if ( $('#moove_gdpr_cookie_modal').length > 0 ) {
                modal_instance = gdpr_lightbox('#moove_gdpr_cookie_modal');
                // $('#moove_gdpr_strict_cookies').trigger('click').trigger('click');
                $('.gdpr_lightbox').addClass('moove_gdpr_cookie_modal_open');
                $(document).moove_gdpr_lightbox_open();
              }
            }, 500);
          }

          if ( hash === 'gdpr-accept-cookies' ) {
            $('#moove_gdpr_cookie_modal').find('input[type=checkbox]').each(function(){
              var checkbox = $(this);
              if ( ! checkbox.is(':checked') ) {
                checkbox.trigger('click');
              }            
            });
            moove_gdpr_save_cookies( 'enable_all enable-all-button' );
            $('.gdpr_lightbox .gdpr_lightbox-close').trigger('click');
            moove_gdpr_hide_infobar();
            save_cookies( true );
            $(document).moove_gdpr_lightbox_close();
          }

          if ( hash === 'gdpr-reject-cookies' ) {
            gdpr_delete_all_cookies();
            gdpr_ajax_delete_cookies();

            if ( $('#moove_gdpr_cookie_info_bar').length > 0 ) {
              $('#moove_gdpr_cookie_info_bar').addClass('moove-gdpr-info-bar-hidden');
              $('body').removeClass('gdpr-infobar-visible');
              $('#moove_gdpr_cookie_info_bar').hide();
              $('#moove_gdpr_save_popup_settings_button').show();
            }
            moove_gdpr_show_infobar();
            moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: '0', advanced: '0'}),cookie_expiration);
            setTimeout(function(){
              moove_gdpr_create_cookie('moove_gdpr_popup',JSON.stringify({strict: '1', thirdparty: '0', advanced: '0'}),cookie_expiration);
            }, 500);
          }
        }
  

      },
      finalize: function() {
        // JavaScript to be fired on all pages, after page specific JS is fired
      }
    }
  };

  // The routing fires all common scripts, followed by the page specific scripts.
  // Add additional events for more control over timing e.g. a finalize event
  var GDPR_UTIL_FE = {
    fire: function(func, funcname, args) {
      var fire;
      var namespace = GDPR_FE;
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
      var gdpr_js_init  = false;
      var gpc_blocked   = false;
      if ( typeof moove_frontend_gdpr_scripts.gpc !== 'undefined' && parseInt( moove_frontend_gdpr_scripts.gpc ) === 1 ) {
        if ( typeof navigator.globalPrivacyControl !== 'undefined' ) {
          gpcValue = navigator.globalPrivacyControl;
          if ( gpcValue ) {
            gpc_blocked = true;
            console.warn('GDPR Cookie Compliance - Blocked by Global Policy Control (GPC)');
          }
        }
      }

      if ( ! gpc_blocked ) {
        if ( typeof moove_frontend_gdpr_scripts.geo_location !== 'undefined' && moove_frontend_gdpr_scripts.geo_location === 'true' ) {
          jQuery.post(
            moove_frontend_gdpr_scripts.ajaxurl,
            {
              action: 'moove_gdpr_localize_scripts',
            },
            function( msg ) {
              var object = JSON.parse( msg );
              if ( typeof object.display_cookie_banner !== 'undefined' ) {
                moove_frontend_gdpr_scripts.display_cookie_banner = object.display_cookie_banner;
              }
              if ( typeof object.enabled_default !== 'undefined' ) {
                moove_frontend_gdpr_scripts.enabled_default = object.enabled_default;
              }
              if ( ! gdpr_js_init ) {
                gdpr_js_init = true;
                GDPR_UTIL_FE.fire('common');
              }
            }
          );
        } else {
          var gdpr_script_delay = typeof moove_frontend_gdpr_scripts.script_delay !== undefined && parseInt( moove_frontend_gdpr_scripts.script_delay ) >= 0 ? parseInt( moove_frontend_gdpr_scripts.script_delay ) : 0;
          if ( gdpr_script_delay > 0 ) {
            setTimeout( function(){
              GDPR_UTIL_FE.fire('common');
            }, gdpr_script_delay );
          } else {
            GDPR_UTIL_FE.fire('common');
          }
        }
      }
      
      // Fire page-specific init JS, and then finalize JS
      $.each(document.body.className.replace(/-/g, '_').split(/\s+/), function(i, classnm) {
        GDPR_UTIL_FE.fire(classnm);
        GDPR_UTIL_FE.fire(classnm, 'finalize');
      });

      // Fire common finalize JS
      GDPR_UTIL_FE.fire('common', 'finalize');
    }
  };

  // Load Events
  $(document).ready(GDPR_UTIL_FE.loadEvents);

})(jQuery); // Fully reference jQuery after this point.
