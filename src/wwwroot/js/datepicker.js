var holiday = ["2012-01-22", "2012-01-23", "2012-02-06", "2012-04-04", "2012-05-01", "2012-06-23", "2012-09-30", "2012-10-01", "2013-01-01"];
var Datepicker = function(b, a) {
    this.target = b || null;
    this.eachW = a.eachW || 177;
    this.eachH = a.eachH || 178;
    this.year = a.year || new Date().getFullYear();
    this.month = a.month || (new Date().getMonth() + 1);
    this.day = a.day || new Date().getDate();
    this.startDate = a.startDate || [];
    this.endDate = a.endDate || [];
    this.getsDatefrom = a.getsDatefrom || null;
    this.ttMonth = a.ttMonth || 2;
    this.direct = a.direct || "";
    this.fromtarget = a.fromtarget || false;
    this.targetValue = null;
    this.selected = [];
    this.isclick = false;
    this.addDays = a.addDays || 0;
    this.cday = 0;
    this.isopen = false;
    this.inputs = [];
    this.callback = a.callback || null;
    this._init()
};

Datepicker.prototype = {
    _init: function() {
        this._startEvent()
    },
    _createPanel: function() {
        var b = document.getElementById("dp_id");
        if (b) {
            return
        }
        else {
            var a = document.createElement("div");
            a.className = "datepicker";
            a.id = "dp_id";
            a.innerHTML = '<div class="pickerwrap"><em class="prevMonth"></em><em class="nextMonth"></em><div class="pickwidth" id="pickwidth"> </div> </div><iframe frameborder="0" marginheight="0" marginwidth="0" id="dateframe" style="position:absolute; left:-8px; top:-8px; overflow:hidden; background:#fff; border:0; z-index:-1; opacity:0; filter:alpha(opacity = 0);"></iframe></div>';
            document.body.appendChild(a)
        }
    },
    _getCalendar: function(d) {
        this.year = d.getFullYear(), this.month = d.getMonth(), this.day = d.getDate();
        var f = this.ttMonth, b = [];
        var c = new Date(this.year, this.month, this.day);
        for (var e = 0; e < f; e++) {
            b[e] = this._getDayList(c, e);
            var a = new Date(c.getFullYear(), c.getMonth() + e + 1, 0).getDate();
            c.setFullYear(c.getFullYear(), c.getMonth(), 1 + a)
        }
        document.getElementById("pickwidth").innerHTML = b.join("");
        document.getElementById("dp_id").style.width = f * this.eachW + "px";
        document.getElementById("dateframe").style.width = (f * this.eachW + 8) + "px";
        document.getElementById("dateframe").style.height = 188 + "px"
    },
    _getDayList: function(v, c) {
        var d = ["日", "一", "二", "三", "四", "五", "六"],
        t = (this.fromtarget) ? this.targetValue[2] : this.startDate[2] || new Date().getDate(),
        //e = (this.fromtarget) ? this.targetValue[1] - 1 : this.startDate[1] || new Date().getMonth(),
        e = (this.fromtarget) ? this.targetValue[1] - 1 : this.startDate[1],
        b = (this.fromtarget) ? this.targetValue[0] : this.startDate[0] || new Date().getFullYear(),
         z = v.getMonth(), m = v.getFullYear(), l = this.cday, h = (this.fromtarget) ? this._operaAddDay(this.addDays, new Date(this.targetValue[0], (this.targetValue[1] - 1), this.targetValue[2])) : this._operaAddDay(this.addDays), q = this.endDate[0] || h[0], g = this.endDate[1] || h[1], r = this.endDate[2] || h[2];
        if (this.endDate.length && (new Date(h[0], h[1], h[2]) < new Date(this.endDate[0], this.endDate[1], this.endDate[2]))) {
            q = h[0]; g = h[1]; r = h[2]
        }
        var a = [], f, u, s = [], w; f = new Date(m, z, 1).getDay(); u = new Date(m, z + 1, 0).getDate();
        for (var p = 1; p <= f; p++) { a.push(0) }
        for (var p = 1; p <= u; p++) { a.push(p) }
        if (!Array.prototype.isIn) {
            Array.prototype.isIn = function(j) {
                var i = this.length;
                while (i--) {
                    if (this[i] == j) {
                        return true
                    }
                }
                return false
            }
        }
        for (var o = 0, n = a.length; o < n; o++) {
            if ((b > m && a[o]) || ((b == m) && (e > z) && a[o]) || ((b == m) && (e == z) && a[o] && (a[o] < t)) || (q < m && a[o]) || ((q == m) && (g < z + 1) && a[o]) || ((q == m) && (g == z + 1) && a[o] && (r < a[o]))) {
                s.push("<li>" + a[o] + "</li>")
            } else {
                if (holiday && holiday.isIn((m + "-" + ((z + 1) < 10 ? ("0" + (z + 1)) : (z + 1)) + "-" + (a[o] < 10 ? ("0" + a[o]) : a[o])))) {
                    s.push('<li><a href="javascript:void(0);" class="hld hl' + m + "" + ((z + 1) < 10 ? ("0" + (z + 1)) : (z + 1)) + "" + (a[o] < 10 ? ("0" + a[o]) : a[o]) + '" title="' + m + "-" + ((z + 1) < 10 ? ("0" + (z + 1)) : (z + 1)) + "-" + (a[o] < 10 ? ("0" + a[o]) : a[o]) + '">&nbsp;</a></li>')
                } else {
                    if ((b == m) && (e == z) && a[o] && a[o] == t) {
                        s.push('<li><a href="javascript:void(0);" class="now" title="' + m + "-" + ((z + 1) < 10 ? ("0" + (z + 1)) : (z + 1)) + "-" + (a[o] < 10 ? ("0" + a[o]) : a[o]) + '">' + a[o] + "</a></li>")
                    } else {
                        if ((m == this.selected[0]) && (z == this.selected[1]) && a[o] && a[o] == l) {
                            s.push('<li><a href="javascript:void(0);" class="choice" title="' + m + "-" + ((z + 1) < 10 ? ("0" + (z + 1)) : (z + 1)) + "-" + (a[o] < 10 ? ("0" + a[o]) : a[o]) + '">' + a[o] + "</a></li>")
                        } else {
                            if (a[o]) {
                                s.push('<li><a href="javascript:void(0);" title="' + m + "-" + ((z + 1) < 10 ? ("0" + (z + 1)) : (z + 1)) + "-" + (a[o] < 10 ? ("0" + a[o]) : a[o]) + '">' + a[o] + "</a></li>")
                            } else {
                                s.push("<li>&nbsp;</li>")
                            }
                        }
                    }
                }
            }
        }
        if (c != 0) {
            w = '<div class="pickerbody"><div class="pickhead"><strong>' + m + "年" + (z + 1) + '月</strong></div><div class="pickweek wbleft"><span class="wkfont">' + d[0] + "</span><span>" + d[1] + "</span><span>" + d[2] + "</span><span>" + d[3] + "</span><span>" + d[4] + "</span><span>" + d[5] + '</span><span class="wkfont">' + d[6] + '</span></div><div class="dateswrap bleft"><ul>' + s.slice(0).join("") + "</ul></div></div>"
        } else {
            w = '<div class="pickerbody"><div class="pickhead"><strong>' + m + "年" + (z + 1) + '月</strong></div><div class="pickweek"><span class="wkfont">' + d[0] + "</span><span>" + d[1] + "</span><span>" + d[2] + "</span><span>" + d[3] + "</span><span>" + d[4] + "</span><span>" + d[5] + '</span><span class="wkfont">' + d[6] + '</span></div><div class="dateswrap"><ul>' + s.slice(0).join("") + "</ul></div></div>"
        }
        return w
    },
    _operaAddDay: function(c, b) {
        var a = b ? new Date(b.getFullYear(), b.getMonth(), b.getDate()) : new Date();
        var d = [];
        if (!!c) {
            a.setFullYear(a.getFullYear(), a.getMonth(), a.getDate() + c);
            d.push(a.getFullYear());
            d.push((a.getMonth() + 1) < 10 ? "0" + (a.getMonth() + 1) : (a.getMonth() + 1)); d.push(a.getDate() < 10 ? "0" + a.getDate() : a.getDate())
        }
        return d
    },
    _onclick: function(h, i, j) {
        var g = MGTOOL.getTarget(h), a = g.nodeName, b = document.getElementById("dp_id"), f, c = new Date(this.year, this.month, this.day);
        if (!this.isopen) {
            return false
        }
        var d = this.callback;
        if (MGTOOL.contains(b, g)) {
            switch (a) {
                case "EM":
                    if (/prevMonth/.test(g.className)) {
                        this._preMonth(c)
                    }
                    if (/nextMonth/.test(g.className)) {
                        this._nextMonth(c)
                    }
                    break;
                case "A":
                    if (d) {
                        d(j, g);
                        this.valuechanged = g.title;
                        this._resetPosition(i, b)
                    }
                    break;
                default:
                    break
            }
            this.isclick = true
        } else {
            this._resetPosition(i, b);
            this.isclick = false
        }
    },
    _preMonth: function(a) {
        a.setMonth(a.getMonth() - 1);
        this._getCalendar(a)
    },
    _nextMonth: function(a) {
        a.setMonth(a.getMonth() + 1);
        this._getCalendar(a)
    },
    _setposition: function(k, c, e) {
        c.style.display = "block"; var h = MGTOOL.getoffset(k), j = h.top, l = h.left, n = document.documentElement ? document.documentElement.scrollTop : document.body.scrollTop, f = document.documentElement ? document.documentElement.scrollLeft : document.body.scrollLeft, b = k.offsetHeight, g = k.offsetWidth, m = c.offsetHeight, d = c.offsetWidth, i = document.documentElement.clientHeight, a = document.documentElement.clientWidth; if ((j - n + m > i && j - n > m) || e == "up") {
            y = j - m; c.style.top = y + "px"
        } else {
            y = j + b; c.style.top = y + "px"
        }
        if (l - f + d > a && l - f > d) {
            x = l - d + g; c.style.left = x + "px"
        } else {
            x = l; c.style.left = x + "px"
        }
        c.style.display = "block";
        this.isopen = true
    },
    _resetPosition: function(a, b) {
        b.style.display = "none";
        this.isopen = false
    },
    _startEvent: function() {
        var f = []; if (this.getsDatefrom) {
            f = this.getsDatefrom.value.split("-")
        } function d(h) {
            var g = /(?:[19|20]\d{2})-(?:0[1-9]|1[0-2])-(?:0[1-9]|[12][0-9]|3[01])/;
            return g.test(h) && h.length == 10
        }
        var e = this; if (e.target) {
            e.target.onfocus = e.target.onclick = function(h) {
                e._createPanel();
                e.targetValue = this.value.split("-");
                var g = this.value && d(this.value) ? new Date(this.value.split("-")[0], this.value.split("-")[1] - 1, this.value.split("-")[2]) : (e.startDate.length && (e.startDate[0] !== "NaN" || !isNaN(e.startDate[0]))) ? new Date(e.startDate[0], e.startDate[1], e.startDate[2]) : new Date();
                if (this.value && !d(this.value)) {
                    e.target.value = ""
                }
                e.selected = [g.getFullYear(), g.getMonth(), g.getDate()];
                e.cday = g.getDate();
                e._getCalendar(g);
                e._setposition(this, document.getElementById("dp_id"), e.direct);
                document.onmousedown = function(i) {
                    e._onclick(i, this, e.target)
                }
            };
            e.target.onblur = function() {
                if (!e.isclick) {
                    e._resetPosition(e.target, document.getElementById("dp_id"));
                    e.isclick = false
                }
            }
        } else {
            var b = MGTOOL.getbyClass(document, "input", "mg_q_datepikcer"); if (b.length) {
                for (var c = 0, a = b.length; c < a; c++) {
                    b[c].onfocus = b[c].onclick = function() {
                        e.target = this; e._createPanel(); e.targetValue = this.value.split("-"); var g = this.value && d(this.value) ? new Date(this.value.split("-")[0], this.value.split("-")[1] - 1, this.value.split("-")[2]) : (e.startDate.length && (e.startDate[0] !== "NaN" || !isNaN(e.startDate[0]))) ? new Date(e.startDate[0], e.startDate[1], e.startDate[2]) : new Date(); e.selected = [g.getFullYear(), g.getMonth(), g.getDate()]; e.cday = g.getDate(); e._getCalendar(g); e._setposition(this, document.getElementById("dp_id"), e.direct);
                        document.onmousedown = function(h) {
                            e._onclick(h, this, e.target)
                        }
                    }
                }
            }
        }
    }
};

var MGTOOL = {
    getEvent: function(e) {
        return e || window.event || top.window.event;
    },
    getTarget: function(e) {
        e = this.getEvent(e);
        return e.target || e.srcElement;
    },
    boxModel: (function() {
        var div = document.createElement("div");
        div.style.width = div.style.paddingLeft = "1px";
        document.body.appendChild(div);
        var boxModel = div.offsetWidth === 2;
        document.body.removeChild(div).style.display = "none";
        div = null;
        return boxModel;
    })(),
    getoffset: function(el) {
        if (!el || !el.ownerDocument) { return null; }
        var pos = {
            left: 0,
            top: 0
        };
        if ("getBoundingClientRect" in document.documentElement) {
            var box = el.getBoundingClientRect(),
			root = el.ownerDocument,
			body = root.body,
			docelem = root.documentElement,
			clTop = docelem.clientTop || body.clientTop || 0,
			clLeft = docelem.clientLeft || body.clientLeft || 0;
            pos.left = box.left + (self.pageXOffset || this.boxModel && docelem.scrollLeft || body.scrollLeft) - clLeft;
            pos.top = box.top + (self.pageYOffset || this.boxModel && docelem.scrollTop || body.scrollTop) - clTop;
            return pos;
        } else {
            var x = 0, y = 0;
            do { x += el.offsetLeft; y += el.offsetTop; } while ((el = el.offsetParent));
            pos.left = x;
            pos.top = y;
            return pos;
        }

    },
    getbyClass: function(parent, tag, name) {
        parent = parent || document;
        tag = tag || "*";
        var arr = [];
        var reg = new RegExp("(^|\\s)" + name + "(\\s|$)");
        var ts = parent.getElementsByTagName(tag);
        for (var i = 0, j = ts.length; i < j; i++) {
            if (reg.test(ts[i].className)) {
                arr.push(ts[i]);
            }
        }
        return arr;

    },
    contains: function(a, b) {
        if (!a) return false;
        var iscontain = false;
        if (a.contains) {
            iscontain = a.contains(b);
        } else {
            iscontain = a.compareDocumentPosition(b) == 20 ? true : false;
        }
        return iscontain;
    }
};

//双程日期控件
function TripBackDate(fromdate, todate) {
    new Datepicker(fromdate, { eachW: 206, ttMonth: 2, callback: fromDateCallback });
    new Datepicker(todate, { eachW: 206, ttMonth: 2, callback: DateCallback });

    function fromDateCallback(o, t) {
        DateCallback(o, t);

        var arr = t.title.split('-');
        var today;
        if (arr.length != 1 && "yyyy-mm-dd" != t.title.value) {
            today = new Date(arr[0], arr[1] - 1, arr[2]);
        } else {
            today = new Date();
            today = new Date(today.getFullYear(), today.getMonth(), today.getDate());
        }
        var firststart = addDatePickerDay(1, today).split('-');
        new Datepicker(todate, { eachW: 206, ttMonth: 2, startDate: [firststart[0], (firststart[1] - 1), firststart[2]], callback: DateCallback });
        setTimeout(function() { todate.focus(); }, 1);
    }
}

//单程日期控件
function OneWayDate(date) {
    new Datepicker(date, { eachW: 206, ttMonth: 2, callback: DateCallback });
}

//回调函数
function DateCallback(o, t) {
    o.value = t.title;
}

//获取相加时间
function addDatePickerDay(num, date) {
    var now = date ? new Date(date.getFullYear(), date.getMonth(), date.getDate()) : new Date();
    var olddate = now.getDate();
    now.setDate(now.getDate() + num);
    return now.getFullYear() + '-' + ((now.getMonth() + 1) < 10 ? "0" + (now.getMonth() + 1) : (now.getMonth() + 1)) + '-' + (now.getDate() < 10 ? "0" + now.getDate() : now.getDate());
}