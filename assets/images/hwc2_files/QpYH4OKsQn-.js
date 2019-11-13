if (self.CavalryLogger) { CavalryLogger.start_js(["47ER3"]); }

__d("TranslationRating",[],(function(a,b,c,d,e,f){e.exports={UNDEFINED:0,VERY_BAD:1,BAD:2,OK:3,GOOD:4,VERY_GOOD:5}}),null);
__d("UFIInstanceAction",[],(function(a,b,c,d,e,f){"use strict";__p&&__p();a={changeOrderingMode:function(a,b){return{type:"story_change_order_mode",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier,mode:b}},toggleComments:function(a){return{type:"story_toggle_comments",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier}},changeCommentListVisibility:function(a,b){return{type:"story_change_visibility",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier,visibility:b}},init:function(a,b){return{type:"instance_init",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier,payload:b}},didRequestVODComments:function(a){return{type:"requested_vod_comments",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier}},didReceiveVODComments:function(a){return{type:"received_vod_comments",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier}},remove:function(a){return{type:"story_remove",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier}},toggleAutoTranslateCommments:function(a){return{type:"toggle_auto_translate_comments",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier}},toggleCommercialBreak:function(a,b){return{type:"story_toggle_commercial_break",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier,inCommercial:b}},translateAll:function(a){return{type:"translate_all",instanceID:a.instanceid,ftentidentifier:a.ftentidentifier}},foundVideoPlayerController:function(a,b){return{ftentidentifier:a.ftentidentifier,instanceID:a.instanceid,videoPlayerController:b,type:"found_video_player_controller"}}};e.exports=a}),null);
__d("ProfileBrowserLink",["URI"],(function(a,b,c,d,e,f){var g,h="/ajax/browser/dialog/",i="/browse/",j=function(a,c,d){return new(g||(g=b("URI")))(a+c).setQueryData(d)};a={constructPageURI:function(a,b){return j(i,a,b)},constructDialogURI:function(a,b){return j(h,a,b)}};e.exports=a}),null);
__d("ProfileBrowserTypes",[],(function(a,b,c,d,e,f){a=Object.freeze({EXTERNALTASK_SUBSCRIBERS:"task_subscribers",FRIEND_CHECKINS:"friendcheckins",FRIENDED_FANS_OF:"friended_fans_of",GROUP_FRIEND_MEMBERS:"group_friend_members",GROUP_JOIN_REQUESTERS_FRIENDS_IN_GROUP:"group_join_requesters_friends_in_group",GROUP_MEMBERS:"group_members",GROUP_MESSAGE_VIEWERS:"group_message_viewers",LIKES:"likes",LIVE_VIDEO_VIEWERS:"live_video_viewers",MUTUAL_FRIENDS:"mutual_friends",OPTION_VOTERS:"option_voters",PAGE_FEATURED_ADMINS:"featured_admins",WORK_ADMIN_GROUP_ADMINS:"work_admin_group_admins",WORK_ADMIN_GROUP_MEMBERS:"work_admin_group_members"});e.exports=a}),null);
__d("StickerInterfaces",[],(function(a,b,c,d,e,f){e.exports=Object.freeze({MESSAGES:"messages",NEO:"neo",COMMENTS:"comments",STICKERED:"stickered",COMPOSER:"composer",POSTS:"posts",FRAMES:"frames",SMS:"sms",MONTAGE:"montage"})}),null);
__d("UFIStickerButton.react",["cx","fbt","Arbiter","Bootloader","FocusRelocator.react","Link.react","React","StickerInterfaces","getObjectValues","setImmediate"],(function(a,b,c,d,e,f,g,h){"use strict";__p&&__p();a=b("React").PropTypes;c=b("React").createClass({displayName:"UFIStickerButton",_clickGuard:!1,_updateListener:null,_openFlyoutListener:null,_linkRef:null,propTypes:{customStickerOwnerID:a.string,onStickerFlyoutShow:a.func,onStickerSelected:a.func.isRequired,showTooltip:a.bool,stickerInterface:a.oneOf(b("getObjectValues")(b("StickerInterfaces"))),tabIndex:a.number},getDefaultProps:function(){return{customStickerOwnerID:"",showTooltip:!0,stickerInterface:"comments"}},getInitialState:function(){return{renderFlyout:null,flyoutShown:!1}},componentDidMount:function(){var a=this;this._updateListener=b("Arbiter").subscribe("page_transition",function(){return a._hideFlyout()});this._openFlyoutListener=b("Arbiter").subscribe("GamingStickers/openFlyout",function(b,c){return a._showFlyout(c)})},componentWillUnmount:function(){this._updateListener&&this._updateListener.unsubscribe(),this._openFlyoutListener&&this._openFlyoutListener.unsubscribe()},render:function(){var a=h._("Post a sticker");return b("React").jsx(b("FocusRelocator.react"),{from:this._linkRef,to:this.refs.icon,children:b("React").jsxs(b("Link.react"),{"aria-label":a,className:"_r1a UFICommentStickerButton","data-hover":"tooltip","data-tooltip-alignh":"center","data-tooltip-content":this.props.showTooltip?a:null,linkRef:this._setRef,onClick:this._onLinkClicked,onMouseDown:this._prepareForClick,role:"button",tabIndex:this.props.tabIndex,children:[b("React").jsx("div",{ref:"icon",className:"UFICommentStickerIcon"+(this.state.flyoutShown?" UFICommentStickerIconActive":"")}),this.props.children,this.state.renderFlyout?this.state.renderFlyout():null]})})},_hideFlyout:function(){this.setState({flyoutShown:!1})},_showFlyout:function(a){var c=this;b("Bootloader").loadModules(["ContextualLayerAutoFlip","LayerTabIsolation","StickersFlyout.react","XUIContextualDialog.react","StickersActions"],function(d,e,f,g,h){c.setState({flyoutShown:!0,renderFlyout:function(){return b("React").jsx(g,{alignment:"right",behaviors:{ContextualLayerAutoFlip:d,LayerTabIsolation:e},className:"_5e-r",contextRef:function(){return c._linkRef},onBlur:c._hideFlyout,onToggle:function(a){!a&&c.state.flyoutShown&&c._hideFlyout()},position:"above",shown:c.state.flyoutShown,hasActionableContext:!0,width:278,children:b("React").jsx("div",{children:b("React").jsx(f,{customStickerOwnerID:c.props.customStickerOwnerID,onEscKeyDown:c._hideFlyout,onStickerSelect:c._onStickerSelected,stickerInterface:c.props.stickerInterface,shown:c.state.flyoutShown})})})}}),c.props.onStickerFlyoutShow&&c.props.onStickerFlyoutShow(),a&&b("setImmediate")(function(){return h.selectTrayPack(a)})},"UFIStickerButton.react")},_prepareForClick:function(){this._clickGuard=this.state.flyoutShown},_onLinkClicked:function(a){a.preventDefault();if(this.state.renderFlyout!==null){this._clickGuard||(this.props.onStickerFlyoutShow&&this.props.onStickerFlyoutShow(),this.setState({flyoutShown:!0}));return}this._showFlyout(null)},_onStickerSelected:function(a,b,c){this.props.onStickerSelected(a,b,c),this._hideFlyout()},_setRef:function(a){this._linkRef=a}});e.exports=c}),null);
__d("ContentTranslationStrings",["fbt","TranslationRating"],(function(a,b,c,d,e,f,g){__p&&__p();a={SEE_TRANSLATION:g._("See Translation"),SEE_TRANSLATION_TIP:g._("Translate this comment"),NO_TRANSLATION_AVAILABLE:g._("No translation available"),AUTOMATICALLY_TRANSLATED:g._("Automatically Translated"),HIDE_ORIGINAL:g._("Hide original"),SEE_ORIGINAL:g._("See original"),SEE_ORIGINAL_LINK:g._("See Original"),UNDO:g._("Undo"),CANCEL:g._("Cancel"),SUBMIT:g._("Submit"),DONE:g._("Done"),CLOSE:g._("Close"),SEARCH:g._("Search"),ENTER_TRANSLATION:g._("Type your translation here"),EDIT_TRANSLATION_THANKS:g._("Thank you! Your feedback helps us improve our translation quality."),EDIT_TRANSLATION_DIALOG_TITLE_ERROR:g._("Submission Unsuccessful"),EDIT_TRANSLATION_MENU:g._("I have a better translation"),RATE_TRANSLATION:g._("Rate this translation"),I_DONT_KNOW:g._("I don't know"),NO_MATCHING_LANGUAGES:g._("No matching languages"),LANGUAGE_SETTINGS:g._("Language settings"),CLICK_TO_RATE:g._("Click a star to rate"),TAP_TO_RATE:g._("Tap a star to rate"),ORIGINAL_TEXT:g._("Original text:"),YOUR_TRANSLATION:g._("Your translation:"),SETTINGS_SAVED:g._("Language settings successfully saved."),REPORT_LANGUAGE_THANKS_FACEBOOK:g._("Thank you for letting us know about this error. Your feedback improves translation for everyone on Facebook."),REPORT_LANGUAGE_THANKS_WORKPLACE:g._("Thank you for letting us know about this error. Your feedback improves translation for everyone on Workplace."),LANGUAGE_SETTINGS_REMINDER:g._("You can change this at any time in your language settings."),CROWDSOURCING_TARGET_DIALECT_DIALOG:g._("Settings"),TRANSLATE_ALL_TEXT:g._("Translate All Comments"),NUM_TRANSLATIONS_TEXT:g._("translations"),getTranslatedFromTo:function(a,b){return g._("Translated from {source language} to {target language}",[g._param("source language",a),g._param("target language",b)])},getTranslatedFrom:function(a){return g._("Translated from {source language}",[g._param("source language",a)])},getReportLanguageDialogBody:function(a,b){b===void 0&&(b=null);return b==="generic"?g._("Are you sure this content was not in {language}?",[g._param("language",a)]):g._("Are you sure this post was not in {language}?",[g._param("language",a)])},getReportLanguage:function(a,b){b===void 0&&(b=null);return b==="generic"?g._("Content was not in {language}",[g._param("language",a)]):g._("Post was not in {language}",[g._param("language",a)])},getReportLanguageSelector:function(a,b){b===void 0&&(b=null);return b==="generic"?g._("This content was actually in: {language selector}",[g._param("language selector",a)]):g._("This post was actually in: {language selector}",[g._param("language selector",a)])},getNeverTranslate:function(a){return g._("Never translate {language}",[g._param("language",a)])},getNeverTranslateDialog:function(a,b){b===void 0&&(b=null);return b==="generic"?g._("Are you sure? Content in {language} won't be translated for you.",[g._param("language",a)]):g._("Are you sure? Posts in {language} won't be translated for you.",[g._param("language",a)])},getDisableAutoTranslate:function(a){return g._("Disable automatic translation for {dialect}",[g._param("dialect",a)])},getDisableAutoTranslateDialog:function(a,b){b===void 0&&(b=null);return b==="generic"?g._("Are you sure? Content in {language} won't be automatically translated for you.",[g._param("language",a)]):g._("Are you sure? Posts in {dialect} won't be automatically translated for you.",[g._param("dialect",a)])},getUserFeedbackTitleForScore:function(a){switch(a){case b("TranslationRating").VERY_BAD:return g._("Very bad.");case b("TranslationRating").BAD:return g._("Bad.");case b("TranslationRating").OK:return g._("OK.");case b("TranslationRating").GOOD:return g._("Good.");case b("TranslationRating").VERY_GOOD:return g._("Very good.");default:return null}},getUserFeedbackDescriptionForScore:function(a){switch(a){case b("TranslationRating").VERY_BAD:return g._("I can't understand anything.");case b("TranslationRating").BAD:return g._("I can't understand most of this.");case b("TranslationRating").OK:return g._("I can understand enough of this.");case b("TranslationRating").GOOD:return g._("I can understand most of this.");case b("TranslationRating").VERY_GOOD:return g._("I can understand everything.");default:return null}}};e.exports=a}),null);
__d("XLtgPostTranslationController",["XController"],(function(a,b,c,d,e,f){e.exports=b("XController").create("/intl/see_translation/",{ftid:{type:"String",required:!0},text_size:{type:"Enum",defaultValue:"medium",enumType:1},data_ft:{type:"String"},tn:{type:"String"}})}),null);
__d("highlight",["Animation","Style"],(function(a,b,c,d,e,f){function a(a,c,d,e){new(b("Animation"))(a).from("background",e||"#fff9d7").to("background",d||"#fff").ease(b("Animation").ease.both).duration(2e3).ondone(function(){b("Style").set(a,"background",""),c&&c()}).go()}e.exports=a}),null);
__d("LtgPostTranslation",["cx","Arbiter","AsyncRequest","ContentTranslationStrings","DOM","Event","LoadingIndicator.react","React","ReactDOM","XLtgPostTranslationController","collectDataAttributes","ge","highlight"],(function(a,b,c,d,e,f,g){"use strict";__p&&__p();a={_renderTranslation:function(a,c){if(!a||!a.parentNode)return;var d=b("DOM").create("div",{className:"_63tb"},c||b("ContentTranslationStrings").NO_TRANSLATION_AVAILABLE);b("DOM").replace(a,d);c&&b("highlight")(d)},bindListener:function(a,c){__p&&__p();var d=this;b("Event").listen(a,"click",function(e){__p&&__p();e.prevent();var f=b("ge")("translationSpinnerPlaceholder_"+c);f&&b("ReactDOM").render(b("React").jsx(b("LoadingIndicator.react"),{size:"small",color:"white"}),f);f=e.getTarget();e=b("collectDataAttributes")(f,["ft"]);f=b("XLtgPostTranslationController").getURIBuilder().setString("ftid",c).setString("data_ft",JSON.stringify(e.ft)).getURI();new(b("AsyncRequest"))().setURI(f).setHandler(function(c){c=c.getPayload();d._renderTranslation(a,c&&c.text);b("Arbiter").inform("ufi/translationRendered")}).setErrorHandler(function(){d._renderTranslation(a,null)}).send()})}};e.exports=a}),null);
__d("LivingRoomProfileTileBadge.react",["cx","Image.react","React"],(function(a,b,c,d,e,f,g){"use strict";function a(a){var c=a.isCommentating||a.isSpeaking,d=a.isSpeaking?b("React").jsx("div",{className:"_6mm6",children:b("React").jsx("span",{className:"_6mlm"})}):null,e=a.asset===null,f=e||a.size==="small"?null:b("React").jsx(b("Image.react"),{className:(a.size==="regular"?"_6y-q":"")+(a.size==="large"?" _6y-r":"")+(a.size==="extra large"?" _7a6j":""),src:a.asset}),g="_6z5p"+(c?" _6y-l":"")+(c?"":" _6y-m")+(a.size==="small"?" _6y-n":"")+(a.size==="regular"?" _6y-o":"")+(a.size==="large"?" _6y-p":"")+(a.size==="extra large"?" _7a6k":"");g=b("React").jsx("div",{className:g,children:f});return b("React").jsxs(b("React").Fragment,{children:[a.size!=="small"?b("React").jsx("div",{className:"_6y-s"+(c?" _6y-t":"")+(c?"":" _6y-u")+(a.useBackgroundColor?" _7a6y":"")}):null,e?null:g,d]})}e.exports=a}),null);