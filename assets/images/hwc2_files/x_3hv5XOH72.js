if (self.CavalryLogger) { CavalryLogger.start_js(["DUQ8m"]); }

__d("isAdgroupAssetFeedRulesConsistentWithField",["AdsAPIAdAssetFeedTitlesFields","AdsAssetFeedUtils","AdsPlacementAssetCustomizationTypes","immutable"],(function(a,b,c,d,e,f){"use strict";__p&&__p();var g=b("AdsPlacementAssetCustomizationTypes").AdsPlacementCustomizationConsistency;function h(a,c){__p&&__p();a=(a=a.creative)==null?void 0:a.asset_feed_spec;if(a==null)return null;a=a[c];if(a==null)return null;a instanceof Array&&(a=b("immutable").fromJS(a));c=a.reduce(function(a,c){c=c.get(b("AdsAPIAdAssetFeedTitlesFields").ADLABELS);c.every(function(b){b=b.get("name");b!=null&&a.push(b);return!0});return a},[]);return b("immutable").Set(c)}function i(a,c){a=(a=a.creative)==null?void 0:(a=a.asset_feed_spec)==null?void 0:a.asset_customization_rules;if(a==null)return null;a instanceof Array&&(a=b("immutable").fromJS(a));a=a.reduce(function(a,b){b=b.getIn([c,"name"]);b!=null&&a.push(b);return a},[]);return b("immutable").Set(a)}function j(a,b){if(a.equals(b))return{status:g.CONSISTENT};if(a.isSubset(b))return{status:g.UNUSED_LABEL_IN_ASSET_LIST,fieldTypeLabels:b.subtract(a)};return b.isSubset(a)?{status:g.UNKNOWN_LABEL_IN_TARGETING_RULE,targetRulesLabelsSet:a.subtract(b)}:{status:g.INCONSISTENT_LABEL_IN_ASSET_LIST_AND_TARGETING_RULE,targetRulesLabelsSet:a.subtract(b),fieldTypeLabels:b.subtract(a)}}function a(a,c,d){__p&&__p();if(!b("AdsAssetFeedUtils").hasPlacementCustomizationFromSpec(a))return{status:g.NOT_PAC_AD};c=h(a,c);a=i(a,d);if(a!=null&&c!=null)return j(a,c);else{if(a!=null)return{status:g.UNKNOWN_LABEL_IN_TARGETING_RULE,targetRulesLabelsSet:a};if(c!=null)return{status:g.UNUSED_LABEL_IN_ASSET_LIST,fieldTypeLabels:c}}return{status:g.NO_ASSET_LIST_AND_RULE_FOUND}}e.exports=a}),null);