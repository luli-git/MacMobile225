if (self.CavalryLogger) { CavalryLogger.start_js(["\/mnVq"]); }

__d("PhotoTagApproval",["Arbiter","CSS","DOM","Event","Parent","PhotosConst","ge"],(function(a,b,c,d,e,f){__p&&__p();a=function(){"use strict";__p&&__p();function a(a){__p&&__p();this.viewer=a;this.units=[];this.currentUnit=0;var c=a.getVersionConst();c==b("PhotosConst").VIEWER_SNOWLIFT?this._root=b("ge")("fbPhotoSnowliftTagApproval"):this._root=b("ge")("fbPhotoPageTagApproval");b("Arbiter").subscribe(a.getEventString("DATA_CHANGE"),this.restartTagApproval.bind(this));b("Arbiter").subscribe("PhotoTagApproval.PENDING_TAG_PHOTO_CLICK",this.pendingTagPhotoClick.bind(this));b("Event").listen(this._root,"click",this.handleClick.bind(this));b("Event").listen(this._root,"mousemove",function(a){this.hiliteCurrentPendingTag(),b("Event").kill(a)}.bind(this));this.restartTagApproval()}var c=a.prototype;c.handleClick=function(a){__p&&__p();a=a.getTarget();if(b("CSS").hasClass(a,"nextPager")&&b("CSS").hasClass(a,"enabled"))this.showNextUnit();else if(b("CSS").hasClass(a,"prevPager")&&b("CSS").hasClass(a,"enabled"))this.showPrevUnit();else if(b("Parent").byClass(a,"fbPhotoApprovalPendingButtons")){var c=this.units[this.currentUnit];c=this.getTagNameID(c);if(c){a=b("Parent").byClass(a,"approve");b("Arbiter").inform("PhotoTagApproval.UPDATE_TAG_BOX",{id:c,approve:a,version:this.viewer.getVersionConst()})}setTimeout(this.removeSelectedUnit.bind(this),0)}return!0};c.loadUnits=function(a){this.units=b("DOM").scry(this._root,"div.fbPhotoApprovalUnit"),this.units.length?(b("CSS").show(this._root),this.showUnit(a),b("CSS").conditionClass(this._root,"hidePagers",this.units.length==1)):(b("CSS").hide(this._root),b("Arbiter").inform("PhotoTagApproval.HILITE_TAG",{tag:null,version:this.viewer.getVersionConst()}))};c.restartTagApproval=function(){this.loadUnits(0)};c.pendingTagPhotoClick=function(a,c){if(c.version!==b("PhotosConst").VIEWER_PERMALINK&&c.version!==b("PhotosConst").VIEWER_SNOWLIFT)return!0;a="approve:"+c.id;for(var c=0;c<this.units.length;c++)if(this.units[c].id===a){this.showUnit(c);return!1}return!0};c.removeSelectedUnit=function(){var a=this.units[this.currentUnit];b("DOM").remove(a);this.loadUnits(this.currentUnit)};c.showNextUnit=function(){this.showUnit(this.currentUnit+1)};c.showPrevUnit=function(){this.showUnit(this.currentUnit-1)};c.getTagNameID=function(a){var b=a.id.indexOf(":");return a.id.slice(b+1)};c.showUnit=function(a){var c;this.units.forEach((c=b("CSS")).hide);this.currentUnit=(a+this.units.length)%this.units.length;a=this.units[this.currentUnit];c.show(a);this.hiliteCurrentPendingTag();c.conditionClass(b("DOM").find(this._root,"a.prevPager"),"enabled",this.currentUnit>0);c.conditionClass(b("DOM").find(this._root,"a.nextPager"),"enabled",this.currentUnit<this.units.length-1)};c.hiliteCurrentPendingTag=function(){var a=this.units[this.currentUnit];a=this.getTagNameID(a);b("Arbiter").inform("PhotoTagApproval.HILITE_TAG",{tag:a,version:this.viewer.getVersionConst()})};return a}();e.exports=a}),null);
__d("PhotoTags",["csx","Arbiter","CSS","DOM","Event","Parent","PhotosConst","ge"],(function(a,b,c,d,e,f,g){__p&&__p();a=function(){"use strict";__p&&__p();function a(a,c,d){var e=this;this.tagTargets=a;this.tagBox=c;this.version=d||b("PhotosConst").VIEWER_PERMALINK;this.handlers=[];this.tagTargets.forEach(function(a){e.handlers.push(b("Event").listen(a,{mouseover:e.showTag.bind(e),mouseout:e.hideTags.bind(e)}))});this.subscriptions=[];this.version==b("PhotosConst").VIEWER_SNOWLIFT&&this.subscriptions.push(b("Arbiter").subscribe("PhotoSnowlift.PAGE",this.hideTags.bind(this)))}var c=a.prototype;c.showTag=function(a){__p&&__p();a=a.getTarget();var c=b("CSS").hasClass(a,"taggee"),d=b("CSS").matchesSelector(a,"._54ru"),e=null,f=null;if(c)e=a.getAttribute("data-tag"),f=a.getAttribute("data-tagtype");else if(d){c=b("Parent").byTag(a,"a");e=c&&c.getAttribute("data-tag")}e||(a=b("Parent").byClass(a,"taggee"),a&&(e=a.getAttribute("data-tag"),f=a.getAttribute("data-tagtype")));d=this.version==b("PhotosConst").VIEWER_PERMALINK?"perm:tag:"+e:"tag:"+e;c=d&&b("ge")(d);c&&(f==="product"?b("CSS").addClass(c,"hover"):b("CSS").addClass(c,"showTag"),b("CSS").addClass(this.tagBox,"showingTag"),b("Arbiter").inform("PhotoTags.SHOWTAG",e))};c.hideTags=function(){b("CSS").removeClass(this.tagBox,"showingTag"),b("DOM").scry(this.tagBox,"div.showTag").forEach(function(a){b("CSS").removeClass(a,"showTag")}),b("DOM").scry(this.tagBox,"div.hover").forEach(function(a){b("CSS").removeClass(a,"hover")}),b("Arbiter").inform("PhotoTags.HIDETAG")};c.destroy=function(){for(var a in this.handlers)this.handlers[a].remove();this.subscriptions.forEach(b("Arbiter").unsubscribe,b("Arbiter"))};return a}();e.exports=a}),null);
__d("PhotoViewerFollow",["Arbiter","AsyncRequest","BanzaiODS","CSS","DOM","Event","Parent","PhotosConst","$","collectDataAttributes"],(function(a,b,c,d,e,f){__p&&__p();var g={};a=function(){"use strict";__p&&__p();function a(a){this.FOLLOW_LOCATION_PHOTO=48,this.viewer=a}var c=a.prototype;c.init=function(a,c,d,e,f,g,h){this.subscribeLink=a,this.unsubscribeFlyout=c,this.subscribeEndpoints=f,this.unsubscribeEndpoints=g,this.unsubLinks=e,this.unsubDiv=d,this.reset(),this.activate(),this.type=h,b("Event").listen(this.subscribeLink,"click",function(a){b("Parent").byClass(a.getTarget(),"photoViewerFollowLink")&&this.subscribePhotoOwner()}.bind(this)),b("Event").listen(this.unsubLinks.user,"click",this.unsubscribePhotoOwner.bind(this)),b("Event").listen(this.unsubLinks.page,"click",this.unsubscribePhotoOwner.bind(this)),b("Arbiter").subscribe(["FollowUser","FollowUserFail","UnfollowUser","UnfollowUserFail"],this.updateSubscribe.bind(this)),b("Arbiter").subscribe(this.viewer.getEventString("DATA_CHANGE"),this.showSubscribeLinkOnChange.bind(this)),this.viewer.getVersionConst()===b("PhotosConst").VIEWER_SNOWLIFT&&(b("Arbiter").subscribe(this.viewer.getEventString("CLOSE"),this.reset.bind(this)),b("Arbiter").subscribe(this.viewer.getEventString("OPEN"),this.activate.bind(this))),this.registerUnsubscribeTarget()};c.activate=function(){this.activated=!0};c.reset=function(){this.unsubscribeFlyout&&this.unsubscribeFlyout.clearNodes(),this.subscriptionChange={},this.activated=!1};c.registerUnsubscribeTarget=function(){if(!this.unsubscribeFlyout)return;var a=b("DOM").scry(this.subscribeLink,".photoViewerFollowedMsg")[0];a&&!b("CSS").hasClass(a,"unsubFlyoutEnabled")&&(this.unsubscribeFlyout.initNode(a),b("CSS").addClass(a,"unsubFlyoutEnabled"))};c.updateSubscribe=function(a,b){if(!this.activated)return;b=b.profile_id;b&&(this.subscriptionChange[b]=a==="FollowUser"||a==="UnfollowUserFail"?"following":"unfollowed",this.toggleSubscribeLink(b))};c.showSubscribeLinkOnChange=function(a,c){this.type=c.ownertype,b("CSS").conditionClass(this.unsubDiv,"isPage",this.type==="page"),this.toggleSubscribeLink(c.owner)};c.toggleSubscribeLink=function(a){var c=b("DOM").scry(this.subscribeLink,"span.fbPhotoSubscribeWrapper")[0];if(!c)return;this.subscriptionChange[a]&&(b("CSS").conditionClass(c,"followingOwner",this.subscriptionChange[a]==="following"),this.subscriptionChange[a]==="unfollowed"&&(this.unsubscribeFlyout&&this.unsubscribeFlyout.hideFlyout(!0)));this.registerUnsubscribeTarget()};c.subscribePhotoOwner=function(){if(!this.viewer.getOwnerId())return;var a=this.type==="user"?{profile_id:this.viewer.getOwnerId()}:{fbpage_id:this.viewer.getOwnerId(),add:!0,reload:!1,fan_origin:"photo_snowlift"};b("Arbiter").inform("FollowUser",{profile_id:this.viewer.getOwnerId()});this.type==="page"&&b("BanzaiODS").bumpEntityKey(2966,"snowlift_page_like","snowlift_page_like.clicked_link");a.location=this.FOLLOW_LOCATION_PHOTO;var c=event.getTarget();c&&Object.assign(a,{ft:b("collectDataAttributes")(c,["ft"]).ft});new(b("AsyncRequest"))(this.subscribeEndpoints[this.type]).setAllowCrossPageTransition(!0).setData(a).setMethod("POST").setReadOnly(!1).setErrorHandler(b("Arbiter").inform.bind(null,"FollowUserFail",a)).send()};c.unsubscribePhotoOwner=function(){if(!this.viewer.getOwnerId())return;var a=this.type==="user"?{profile_id:this.viewer.getOwnerId()}:{fbpage_id:this.viewer.getOwnerId(),add:!1,reload:!1};b("Arbiter").inform("UnfollowUser",{profile_id:this.viewer.getOwnerId()});a.location=this.FOLLOW_LOCATION_PHOTO;var c=event.getTarget();c&&Object.assign(a,{ft:b("collectDataAttributes")(c,["ft"]).ft});new(b("AsyncRequest"))(this.unsubscribeEndpoints[this.type]).setAllowCrossPageTransition(!0).setData(a).setMethod("POST").setReadOnly(!1).setErrorHandler(b("Arbiter").inform.bind(null,"UnfollowUserFail",a)).send()};a.createInstance=function(c,d,e,f,h,i,j,k){c=c.getInstance();var l=new a(c);l.init(b("$")(d),e,f,h,i,j,k);g[c.getVersionConst()]=l;return l};a.getInstance=function(a){return g[a]};return a}();e.exports=a}),null);
__d("PhotoViewerInitPagelet",["DOM","PhotoSnowlift","PhotoTagApproval","PhotoTagger","PhotoTags","ge"],(function(a,b,c,d,e,f){__p&&__p();a=function(a){"use strict";__p&&__p();b("PhotoSnowlift").attachTagger(a.tagging,a.tokenizer,a.ufi);var c=b("PhotoSnowlift").getInstance(),d=c.getRoot();new(b("PhotoTags"))([b("ge")("fbPhotoSnowliftAuthorName"),b("DOM").find(d,"span.fbPhotoTagList"),b("DOM").find(d,"div.fbCommerceProductMiniListHscroll")],b("ge")("fbPhotoSnowliftTagBoxes"),a.version);if(a.setupPhotoTagger){d=new(b("PhotoTagger"))(c);d.initSnowlift(a.tagging,a.tokenizer,a.userId,a.ufi);d.setQueueName(a.queueName)}new(b("PhotoTagApproval"))(c)};e.exports=a}),null);
__d("TagToken",["DOM","Token"],(function(a,b,c,d,e,f){__p&&__p();a=function(a){"use strict";__p&&__p();babelHelpers.inheritsLoose(c,a);function c(b){return a.call(this,b,"tag")||this}var d=c.prototype;d.createElement=function(){var a=this.isFreeform(),c=b("DOM").create("span",{className:"separator"},", "),d=b("DOM").create(a?"span":"a",{className:"taggee","data-tag":this.getValue()},this.getText());a||(d.href=this.getInfo().path);return b("DOM").create("span",{className:"tagItem"},[c,d])};return c}(b("Token"));e.exports=a}),null);
__d("TagTokenizer",["fbt","Arbiter","CSS","DOM","Parent","TagToken","Tokenizer","createObjectFrom","ge","getElementText"],(function(a,b,c,d,e,f,g){__p&&__p();a=function(a){"use strict";__p&&__p();babelHelpers.inheritsLoose(c,a);function c(c,d,e,f,g){e=a.call(this,e,f,g)||this;b("Arbiter").subscribe("PhotoInlineEditor.CANCEL_INLINE_EDITING",e.updateTokenareaVisibility.bind(babelHelpers.assertThisInitialized(e)),"new");e.appphoto=d;b("Arbiter").subscribe(c.getInstance().getEventString("DATA_CHANGE"),e.setup.bind(babelHelpers.assertThisInitialized(e)),"new");return e}var d=c.prototype;d.setup=function(a,b){this.appphoto=b.byapp;this.byowner=b.isowner;return this.reset()};d.reset=function(){var c=this,d=this.getTokenElements().map(this.getTokenDataFromTag,this);this.withTagKeys={};var e=this.getWithTagTokenElements().map(function(a){return c._tokenKey(c.getTokenDataFromTag(a))});this.withTagKeys=b("createObjectFrom")(e);return a.prototype.reset.call(this,d)};d.processEvents=function(a,c,d){if(b("Parent").byClass(c,"remove")){d=this.getTokenFromElement(d);d=this.addTokenData(d,c);this.removeToken(d);a.kill()}};d.insertToken=function(a){return null};d.removeToken=function(a){if(this.appphoto)return this.replaceToken(a);else this.inform("removeToken",a),b("Arbiter").inform("Form/change",{node:this.element});return null};d.addTokenData=function(a,c){b("Parent").byClass(c,"blockuser")&&(a.blockUser=!0);return a};d.getTokenDataFromTag=function(a){return{uid:b("DOM").find(a,"input").value,text:b("getElementText")(b("DOM").find(a,".taggee"))}};d.getTokenElementFromTarget=function(a){return b("Parent").byClass(a,"tagItem")};d.getTokenElements=function(){return b("DOM").scry(this.tokenarea,"span.tagItem").filter(this.filterNonTokenElements,this)};d.getWithTagTokenElements=function(){return b("DOM").scry(this.tokenarea,"span.withTagItem")};d.filterNonTokenElements=function(a){return!b("CSS").hasClass(a,"markasspam")&&!b("CSS").hasClass(a,"reported")&&!b("CSS").hasClass(a,"withTagItem")};d.createToken=function(a,c){var d=this.getToken(this._tokenKey(a));d=d||new(b("TagToken"))(a);c&&d.setElement(c);return d};d.updateTokenareaVisibility=function(){var a=this.getTokenElements().filter(function(a){return b("CSS").shown(a)}),c=this.getWithTagTokenElements(),d=b("DOM").scry(this.tokenarea,"span.ogTagItem");b("CSS").conditionShow(this.tokenarea,a.length!==0||c.length!==0||d.length!==0)};d.replaceToken=function(a){__p&&__p();if(!a)return;var c=this.tokens.indexOf(a);if(c<0)return;this.tokens.splice(this.tokens.indexOf(a),1);delete this.unique[this._tokenKey(a.getInfo())];c=b("ge")("tagspam"+a.getValue());c&&b("DOM").remove(c);c=[" [",g._("Tag Removed.")," "];c.push(b("DOM").create("a",{onclick:this.markAsSpam.bind(this,a.getValue())},g._("Mark tag as spam")));c.push("] ");c=b("DOM").create("span",{className:"fbPhotosTaglistTag tagItem markasspam",id:"tagspam"+a.getValue()},c);b("DOM").replace(a.getElement(),c);this.updateTokenarea();this.inform("removeToken",a);b("Arbiter").inform("Form/change",{node:this.element})};d.markAsSpam=function(a){var c=b("ge")("tagspam"+a),d=[" [",g._("Tag Reported"),"] "];d=b("DOM").create("span",{className:"fbPhotosTaglistTag tagItem reported",id:"tagspam"+a},d);b("DOM").replace(c,d);this.inform("markTagAsSpam",a)};d.removeTokenForSpatialTag=function(b){a.prototype.removeToken.call(this,b)};return c}(b("Tokenizer"));e.exports=a}),null);