function VSxClientCountrySelector(clientID, sourceItems, direction) {
    // 私有属性
    this.sourceItems = sourceItems;
    this.currentPageSize = 0;
    this.pageCount = 0;
    this.pageIndex = -1;
    this.mainElement = $("#" + this.clientID);
    this.inputElement = $("#" + clientID);
    this.onClientPicked;
    this.clientID = clientID;

    // 公共属性
    this.PageSize = 11;
    this.NumericButtonCount = 5;
    this.PrevButtonText = "&lt;";
    this.NextButtonText = "&gt;";
    this.EmptyListText = "不支持该城市！";
    this.Tip = "模糊查询，用↑↓键选择。";
    this.EmptyText = "输入中文/英文";
    this.IsEmptyText = ($.trim(this.inputElement.val()) == "");

    if (this.IsEmptyText) {
        this.inputElement.val(this.EmptyText);
        this.inputElement.addClass("s-f-empty-text");
    }

    var instance = this;

    this.selectItemIndex = -1;
    this.filterItems = new Array();

    // fn
    this.selectItem = null;
    this.enterItem = null;
    this.buildPage = null;

    //热门控件
    this.country = null;
    this.direction = direction;
}

VSxClientCountrySelector.prototype.Init = function() {
    var instance = this;
    //热门控件对象
    instance.country = new HotCountryHtml(instance.isEmptyText, instance.EmptyText, instance.inputElement, instance.direction);

    instance.inputElement
    .click(function() {
        if (instance.GetText() == "") {
            instance.country.Show();
            instance.HidePopupWindow();
        } else {
            instance.country.Hide();
            if (instance.popupElement != null)
                instance.popupElement.show();
        }
    }).focus(function() {
        if (instance.GetText() == "") {
            instance.country.Show();
        } else {
            instance.country.Hide();
            instance.ShowPopupWindow();
        }
    }).blur(function() {
        if (instance.GetText() == "") {
            if (!instance.lockPopup && !instance.country.lockPopup) {
                instance.SetText(instance.EmptyText);
                instance.inputElement.addClass("s-f-empty-text");
                instance.IsEmptyText = true;
            }
        }
        else {
            instance.inputElement.removeClass("s-f-empty-text");
            instance.IsEmptyText = false;
        }

        if (!instance.lockPopup) {
            instance.HidePopupWindow();
        }
        else {
            instance.lockPopup = false;
        }
        if (!instance.country.lockPopup) {
            instance.country.Hide();
        }
        else {
            instance.country.lockPopup = false;
        }
    }).keyup(function(event) {
        switch (event.keyCode) {
            case 13:
            case 27:
            case 37:
            case 38:
            case 39:
            case 40:
                return false;
        }
        if (instance.GetText() == "") {
            instance.country.Show();
            instance.HidePopupWindow();
        } else {
            instance.country.Hide();
            instance.ShowPopupWindow();
        }
    }).keydown(function(event) {
        switch (event.keyCode) {
            case 13:
                instance.enterItem(instance.popupElement.find(".list div:eq(" + instance.selectItemIndex + ")"));
                return false;

            case 27:    // Esc
                instance.country.Hide();
                instance.HidePopupWindow();
                return false;

            case 37:    // 左
                instance.PageUp();
                return false;

            case 39:    // 右
                instance.PageDown();
                return false;

            case 38:    // 上
                instance.MoveUp();
                return false;

            case 40:    // 下
                instance.MoveDown();
                return false;
        }
    });

    this.enterItem = function(a) {
        instance.SetText(a.children(".p").text());
        instance.inputElement.removeClass("s-f-empty-text");
        this.IsEmptyText = false;
        instance.HidePopupWindow();

        if (typeof (instance.onClientPicked) == "function") {
            instance.onClientPicked();
        }
    }

    this.buildPage = function(pageIndex) {
        instance.currentPageSize = 0;
        instance.pageCount = 0;

        // 列表
        var listHtml = "";
        if (instance.filterItems.length == 0) {
            instance.popupElement.children(".tip").html(instance.EmptyListText);
        }
        else {
            var evenRow = false;
            for (var i = pageIndex * instance.PageSize; i < Math.min(instance.filterItems.length, (pageIndex + 1) * instance.PageSize); i++) {
                evenRow = !evenRow;

                listHtml += "<div";
                if (evenRow) {
                    listHtml += " class='even'";
                }
                listHtml += ">";
                // 英文
                listHtml += "<span class='p'>";
                listHtml += instance.filterItems[i].z;
                listHtml += "</span>";

                // 中文（国家）
                listHtml += "<span class='c'>";
                listHtml += "" + instance.filterItems[i].p + "(" + instance.filterItems[i].i + ")";
                listHtml += "</span>";
                listHtml += "</div>";

                instance.currentPageSize++;
            }
            instance.popupElement.children(".tip").html(instance.Tip);
        }

        instance.popupElement.children(".list").empty().append(listHtml);
        instance.popupElement.find(".list>div").click(function() {
            instance.enterItem($(this));
            return false;
        }).hover(function() {
            $(this).addClass("hover");
        }, function() {
            $(this).removeClass("hover");
        });

        // 分页
        if (instance.filterItems.length > instance.PageSize) {
            var pagerHtml = "";

            instance.pageCount = Math.ceil(instance.filterItems.length / instance.PageSize);
            var pageStart = Math.max(0, Math.min(instance.pageCount - instance.NumericButtonCount, pageIndex - Math.floor(instance.NumericButtonCount / 2)));
            var pageEnd = Math.min(instance.pageCount - 1, pageStart + instance.NumericButtonCount - 1);

            // 上一页
            if (pageStart > 0) {
                pagerHtml += "<a href='javascript:' pageIndex='" + (pageIndex - 1) + "'>" + instance.PrevButtonText + "</a>";
            }
            // 页码
            for (var i = pageStart; i <= pageEnd; i++) {
                if (i == pageIndex) {
                    pagerHtml += "<span>[";
                    pagerHtml += i + 1;
                    pagerHtml += "]</span>";
                }
                else {
                    pagerHtml += "<a href='javascript:' pageIndex='" + i + "'>";
                    pagerHtml += i + 1;
                    pagerHtml += "</a>";
                }
            }
            // 下一页
            if (pageEnd < instance.pageCount - 1) {
                pagerHtml += "<a href='javascript:' pageIndex='" + (pageIndex + 1) + "'>" + instance.NextButtonText + "</a>";
            }

            instance.popupElement.children(".pager").empty().append(pagerHtml).show().children("a[pageIndex]").click(function() {
                instance.buildPage(parseInt($(this).attr("pageIndex")));
                return false;
            });
        }
        else {
            instance.popupElement.children(".pager").hide();
        }

        instance.pageIndex = pageIndex;

        var itemIndex = instance.selectItemIndex;
        if (itemIndex > instance.currentPageSize - 1)
            itemIndex = instance.currentPageSize - 1;

        instance.selectItem(itemIndex);
    }

    this.selectItem = function(index) {
        if (instance.currentPageSize > 0 && index >= 0 && index < instance.currentPageSize) {
            instance.popupElement
                .find(".list>div")
                .removeClass("selected")
                .eq(index).addClass("selected");
            instance.selectItemIndex = index;
        }
    }
}

// 下页
VSxClientCountrySelector.prototype.PageDown = function () {
    var index = this.pageIndex + 1;

    if (index <= this.pageCount - 1)
        this.buildPage(index);
}
// 上页
VSxClientCountrySelector.prototype.PageUp = function () {
    var index = this.pageIndex - 1;

    if (index >= 0)
        this.buildPage(index);
}

// 下条
VSxClientCountrySelector.prototype.MoveDown = function () {
    var index = this.selectItemIndex + 1;

    if (index > this.currentPageSize - 1)
        index = 0;
    this.selectItem(index);
}

// 上条
VSxClientCountrySelector.prototype.MoveUp = function () {
    var index = this.selectItemIndex - 1;

    if (index < 0)
        index = this.currentPageSize - 1;
    this.selectItem(index);
}

// 显示下拉列表
VSxClientCountrySelector.prototype.ShowPopupWindow = function () {
    var instance = this;
    if (this.popupElement == null) {
        var popupHtml = "";
        popupHtml += "<div style='display: none; position: absolute;' class='htCitySelector shadow'>";
        popupHtml += "<div class='tip'>";
        popupHtml += this.Tip;
        popupHtml += "</div>";
        popupHtml += "<div class='list'>";
        popupHtml += "</div>";
        popupHtml += "<div class='pager'>";
        popupHtml += "</div>";
        popupHtml += "</div>";
        this.popupElement = $(popupHtml).appendTo("body")
                                .mousedown(function () { return false; })
                                .focusin(function () { instance.lockPopup = true; })
                                .focusout(function () {
                                    if (instance.GetText() == "") {
                                        instance.SetText(instance.EmptyText);
                                        instance.inputElement.addClass("s-f-empty-text");
                                        instance.IsEmptyText = true;
                                    }
                                    instance.HidePopupWindow();
                                });
    }
    instance.RefreshList();
    var inputElementLocation = instance.inputElement.offset();
    instance.popupElement
        .css("left", inputElementLocation.left + "px")
        .css("top", inputElementLocation.top + instance.inputElement.outerHeight() + "px")
        .show();
}

// 隐藏下拉列表
VSxClientCountrySelector.prototype.HidePopupWindow = function () {
    if (this.popupElement!=null)
        this.popupElement.hide();
}

// 刷新列表
VSxClientCountrySelector.prototype.RefreshList = function () {
    var instance = this;
    var startWidth = function (src, dest) {
        //if (src.toLowerCase().substr(0, dest.length) == dest.toLowerCase())
        if (src.toLowerCase().indexOf(dest.toLowerCase()) != -1 )
            return true;
        else
            return false;
    }

    var filter = $.trim(instance.GetText());
    instance.filterItems.length = 0;

    for (var i in this.sourceItems) {
        if (this.sourceItems[i].z == "")
            continue;

        if (startWidth(this.sourceItems[i].z, filter)
                || startWidth(this.sourceItems[i].p, filter)
                || startWidth(this.sourceItems[i].i, filter)
            ) {
            instance.filterItems.push(this.sourceItems[i]);
        }
    }

    instance.selectItemIndex = 0;
    instance.buildPage(0);
}

// 设置焦点
VSxClientCountrySelector.prototype.SetFocus = function () {
    this.inputElement.focus();
}

// 获得文本
VSxClientCountrySelector.prototype.GetText = function () {
    if (this.EmptyText == $.trim(this.inputElement.val())) {
        this.isEmptyText = true;
        return "";
    }
    return $.trim(this.inputElement.val());
}

// 设置文本
VSxClientCountrySelector.prototype.SetText = function (value) {
    value = $.trim(value);
    if (value == "") {
        this.inputElement.val(this.EmptyText);
        this.inputElement.addClass("s-f-empty-text");
        this.IsEmptyText = true;
    }
    else {
        this.inputElement.val(value);
        this.inputElement.removeClass("s-f-empty-text");
        this.IsEmptyText = false;
    }
}

// 获取城市编码
VSxClientCountrySelector.prototype.GetCityName = function () {
    var text = this.GetText();
    if ($.trim(text) != "") {
        for (var i in this.sourceItems) {
            if (this.sourceItems[i].z == text) {
                return this.sourceItems[i].z;
            }
        }
    }
    return "";
}

VSxClientCountrySelector.prototype.GetMainElement = function () {
    return this.inputElement[0];
}

//热门国家
function HotCountryHtml(isEmptyText, EmptyText, inputElement, direction) {
    //传入参数
    this.EmptyText = EmptyText;
    this.inputElement = inputElement;
    this.direction = direction;
    this.inputElementLocation = this.inputElement.position();
    this.left = this.inputElementLocation.left;
    this.top = this.inputElementLocation.top + this.inputElement.outerHeight();
    //选择
    this.enterItem = function(a) {
        itemClass.SetText(a.children('code').text());
        itemClass.inputElement.removeClass("s-f-empty-text");
        itemClass.Hide();
    };

    var itemClass = this;
    this.itemHtml = $("#hotcityDiv")
        .css("left", this.left + this.inputElement.width() + 8 + "px")
        .css("top", this.top - this.inputElement.height() -3 + "px")
        .hide();

    //靠右
    if (itemClass.direction == "right")
        this.itemHtml.css("left", this.left - this.itemHtml.width() + "px");

    this.itemHtml.mousedown(function() { return false; })
                    .focusin(function () { itemClass.lockPopup = true;});
    itemClass.itemHtml.find(".hotcity-list-content>li").click(function () {
        itemClass.enterItem($(this));
        return false;
    });
    //显示
    this.Show = function (s) {
        this.itemHtml.show();
        if (this.EmptyText == $.trim(this.inputElement.val())) {
            this.inputElement.val('');
            this.inputElement.removeClass("s-f-empty-text");
            isEmptyText = true;
        }
    }

    // 隐藏
    this.Hide = function () {
        this.itemHtml.hide();
    }

    // 设置文本
    this.SetText = function (value) {
        value = $.trim(value);
        if (value == "") {
            this.inputElement.val(this.EmptyText);
            this.inputElement.addClass("s-f-empty-text");
            isEmptyText = true;
        }
        else {
            this.inputElement.val(value);
            this.inputElement.removeClass("s-f-empty-text");
            isEmptyText = false;
        }
    }
}