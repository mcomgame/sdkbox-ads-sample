#include "HelloWorldScene.h"

#include "PluginSdkboxAds/PluginSdkboxAds.h"

#include "PluginBee7/PluginBee7.h"
#include "PluginAdMob/PluginAdMob.h"

USING_NS_CC;

using namespace sdkbox;

Scene* HelloWorld::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }

    Size size = CCDirector::getInstance()->getWinSize();
    std::string defaultFont("arial.ttf");
    int defaultFontSize = 32;
    
    
    // Pre-cache
    sdkbox::PluginAdMob::cache("gameover");
    
    
    Menu* menu = Menu::create(MenuItemFont::create("Group 1",
                                                   [](Object *obj) {
                                                        sdkbox::PluginSdkboxAds::placement("placement-1");
                                                    }),
                              MenuItemFont::create("Group 2",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::placement("placement-2");
                                                   }),
                              MenuItemFont::create("Default Ad",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::playAd();
                                                   }),
                              MenuItemFont::create("----"),
                              MenuItemFont::create("AdColony video",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::playAd("AdColony", "video");
                                                   }),
                              MenuItemFont::create("AdColony Reward",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::playAd("AdColony", "v4vc");
                                                   }),
                              MenuItemFont::create("AdMob",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::playAd("AdMob", "gameover");
                                                   }),
                              MenuItemFont::create("Fyber Interstital",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::playAd("Fyber", "INTERSTITIAL" );
                                                   }),
                              MenuItemFont::create("Fyber Reward",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::playAd("Fyber", "REWARDED" );
                                                   }),
                              MenuItemFont::create("Bee7 (Portrait Only!)",
                                                   [](Object *obj) {
                                                       // TBD: need to switch to playAd call
                                                       sdkbox::PluginSdkboxAds::playAd("Bee7", "any" );
                                                   }),
                              MenuItemFont::create("Chartboost Interstitial",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::playAd("Chartboost", "Default");
                                                   }),
                              MenuItemFont::create("Chartboost Reward Video",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::playAd("Chartboost", "Level Complete");
                                                   }),
                              MenuItemFont::create("Vungle Video",
                                                   [](Object *obj) {
                                                       sdkbox::PluginSdkboxAds::playAd("Vungle", "reward");
                                                   }),
                              NULL
                              );
    
    menu->alignItemsVerticallyWithPadding(5);
    menu->setPosition(size.width/2, size.height/2);
    addChild(menu);
    
    sdkbox::PluginSdkboxAds::setListener(this);
    
    return true;
}

void HelloWorld::onAdAction( const std::string& ad_unit_id, const std::string& zone, sdkbox::AdActionType action_type) {
    CCLOG("   ADS: '%s' '%s' '%s'", ad_unit_id.c_str(), zone.c_str(), sdkbox::AdActionTypeToString(action_type).c_str());
}
void HelloWorld::onRewardAction( const std::string& ad_unit_id, const std::string& zone, float reward_amount, bool reward_succeed) {
    CCLOG("   REWARDS: '%s' '%s' %f '%s'", ad_unit_id.c_str(), zone.c_str(), reward_amount, reward_succeed?"Success" : "fail");
}
