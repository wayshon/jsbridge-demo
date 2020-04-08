function sleep(numberMillis) {
    let now = new Date();
    const exitTime = now.getTime() + numberMillis;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime)
            return;
    }
}

function init(cb) {
    sleep(2000);
    cb('hahaha6666');
}

sleep(2000);
OCObj.showHtml('hahahahaha');
