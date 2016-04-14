var Index = function () {
    
    // function to initiate EasyPieChart
    var runEasyPieChart = function () {
        if (isIE8 || isIE9) {
            if (!Function.prototype.bind) {
                Function.prototype.bind = function (oThis) {
                    if (typeof this !== "function") {
                        // closest thing possible to the ECMAScript 5 internal IsCallable function
                        throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
                    }
                    var aArgs = Array.prototype.slice.call(arguments, 1),
                        fToBind = this,
                        fNOP = function () {}, fBound = function () {
                            return fToBind.apply(this instanceof fNOP && oThis ? this : oThis, aArgs.concat(Array.prototype.slice.call(arguments)));
                        };
                    fNOP.prototype = this.prototype;
                    fBound.prototype = new fNOP();
                    return fBound;
                };
            }
        }
        $('.easy-pie-chart .bounce').easyPieChart({
            animate: 1000,
            size: 70
        });
        $('.easy-pie-chart .cpu').easyPieChart({
            animate: 1000,
            lineWidth: 3,
            barColor: '#35aa47',
            size: 70
            
        });
    };

    return {
        init: function () {
            //runChart1();
            //runChart2();
            //runChart3();
            //runSparkline();
            runEasyPieChart();
            //runFullCalendar();
        }
    };
}();