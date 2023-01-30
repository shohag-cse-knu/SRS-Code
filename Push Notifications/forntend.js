<!-- set to all -->
<script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
<script>
    var OneSignal = window.OneSignal || [];
    var isAndroid = /(android)/i.test(navigator.userAgent);
    if(!isAndroid){
    OneSignal.push(function() {
        OneSignal.init({
            appId: "ac2f9027-6bc9-48f8-aba0-753819819047",
        });
        /* These examples are all valid */
        var isPushSupported = OneSignal.isPushNotificationsSupported();
        if (isPushSupported) {
            // Push notifications are supported
            console.log('browser is supported');
            OneSignal.isPushNotificationsEnabled(function(isEnabled) {
                if (isEnabled) {
                    //console.log("Push notifications are enabled!");
                    OneSignal.getUserId(function(userId) {
                        console.log("OneSignal User ID:", userId);
                        $.cookie('os_uid', userId, { expires: 1, path: '/', domain: 'forex-bangla.com', secure: true });
                    });
                } else {
                    //console.log("Push notifications are not enabled yet.");
                    OneSignal.push(function() {
                        OneSignal.showHttpPrompt();
                    });
                }
            });
        } else {
            // Push notifications are not supported
            console.log('Not Suppoted');
        }
    });}
</script>
<!-- wp by onesignal -->