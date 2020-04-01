// function Page() {
//     this.setState = (data) => {
//         OCObj.showHtml(data);
//     }
//     this.init = () => {
//         let i = 1000000;
//         while (i) {
//             i--;
//         }
//     }
// }
// const p = new Page();
// // p.init();
// p.showHtml('hahaha');

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
    sleep(5000);
    cb('hahaha6666');
}

sleep(5000);
OCObj.showHtml('hahahahaha 88888');