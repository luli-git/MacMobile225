if (self.CavalryLogger) { CavalryLogger.start_js(["gXRgv"]); }

__d("ReactComposerPlayWithFriendsSproutContainer.react",["InstantGamesFeedTypedLogger","React","ReactComposerContextTypes","ReactComposerSproutsDefaultUIConfigTyped","ReactComposerStore","ReactComposerTaggerSproutContainer.react","ReactComposerTaggerType"],(function(a,b,c,d,e,f){"use strict";__p&&__p();a=function(a){__p&&__p();babelHelpers.inheritsLoose(c,a);function c(){return a.apply(this,arguments)||this}var d=c.prototype;d.componentDidMount=function(){var a=b("ReactComposerStore").getTargetType(this.context.composerID);new(b("InstantGamesFeedTypedLogger"))().setEvent("play_with_friends_composer_sprout_shown").setUISurface("play_with_friends_attachment").setGroupID(a=="group"?this.context.targetID:null).setPosterID(a=="feed"?this.context.targetID:null).log()};d.render=function(){return b("React").jsx(b("ReactComposerTaggerSproutContainer.react"),{uiConfig:this.props.uiConfig,taggerID:b("ReactComposerTaggerType").PLAY_WITH_FRIENDS})};return c}(b("React").PureComponent);a.contextTypes=b("ReactComposerContextTypes");a.defaultProps={uiConfig:b("ReactComposerSproutsDefaultUIConfigTyped").sproutsUIConfigMap.PLAY_WITH_FRIENDS};e.exports=a}),null);
__d("XWorkHubController",["XController"],(function(a,b,c,d,e,f){e.exports=b("XController").create("/notifications/hub/{?tab}/{?alert_id}/",{ref:{type:"String"},tab:{type:"String"},selected_key:{type:"String",defaultValue:"app_401904056828201"},alert_id:{type:"String"},mini:{type:"Bool",defaultValue:!1}})}),null);