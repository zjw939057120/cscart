{** block-description:tmpl_copyright **}
<style>
    /* 返回顶部样式 */
    .back-to {
        bottom: 55px;
        overflow: hidden;
        position: fixed;
        right: 10px;
        width: 110px;
        z-index: 999;
    }

    .back-to .back-top {
        background: url("./images/top.png") no-repeat scroll 0 0 transparent;
        display: block;
        float: right;
        height: 50px;
        margin-left: 10px;
        outline: 0 none;
        text-indent: -9999em;
        width: 50px;
    }

    .back-to .back-top:hover {
        background-position: -50px 0
    }

</style>
<style>
    /* 底部提示框样式 */
    .login-alert {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #0d3b54;
        color: white;
        padding: 10px 20px;
        border-radius: 20px;
        position: fixed;
        bottom: 20px;
        left: 25%;
        width: 50%;
        box-sizing: border-box;
        z-index: 1000;
    }

    .alert-text {
        font-size: 18px;
        margin-right: 20px;
    }

    #login-button {
        background-color: white;
        color: #0d3b54;
        border: none;
        padding: 10px 20px;
        border-radius: 10px;
        font-size: 18px;
        cursor: pointer;
    }

    #login-button:hover {
        background-color: #f0f0f0;
    }

    #close-alert {
        background: none;
        border: none;
        color: white;
        font-size: 20px;
        cursor: pointer;
    }

    #close-alert:hover {
        color: #c0c0c0;
    }
</style>

<!-- 返回顶部样式 -->
<div style="display:none;" class="back-to" id="toolBackTop">
    <a title="返回顶部" onclick="window.scrollTo(0,0);return false;" href="#top" class="back-top"></a>
</div>


<!-- 底部未登录提示框 -->
{if !$auth.user_id}
<div id="login-alert" class="login-alert">
    <span class="alert-text">{__("bottom_login_text")}</span>
    <button id="login-button">{__("bottom_login_lable")}</button>
    <button id="close-alert">×</button>
</div>
{/if}
<script>
    $(function () {
        var bt = $('#toolBackTop');
        var sw = $(document.body)[0].clientWidth;
        //未登录提示框
        var loginAlert = $('#login-alert');

        var limitsw = (sw - 840) / 2 - 80;  //距离右侧距离
        if (limitsw > 0) {
            limitsw = parseInt(limitsw);
            bt.css("right", limitsw / 8);
        }

        $(window).scroll(function () {
            var st = $(window).scrollTop();
            if (st > 30) {
                bt.show();
                loginAlert.hide(); // 隐藏提示框
            } else {
                bt.hide();
                loginAlert.show(); // 显示提示框
            }
        });

        $("#login-button").click(function(){
            location.href="/index.php?dispatch=auth.login_form";
        });
        $("#close-alert").click(function(){
            $("#login-alert").remove();
        });

    });
</script>
<p>
    {*版权信息*}
    <div class="bottom-copyright">
    <a class="bottom-copyright" href="https://beian.miit.gov.cn" target="_blank">{__("icp_beian")}</a>
    <span class="bottom-copyright">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
    <a class="bottom-copyright" href="/index.php?dispatch=pages.view&page_id=46" target="_blank">{__("drug_medical_device_filing")}</a>
    <span class="bottom-copyright">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
    <a class="bottom-copyright" href="/index.php?dispatch=pages.view&page_id=47" target="_blank">{__("medical_device_business")}</a>
    <span class="bottom-copyright">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
    <a class="bottom-copyright" href="/index.php?dispatch=pages.view&page_id=48" target="_blank">{__("publication_license")}</a>
    <span class="bottom-copyright">&nbsp;&nbsp;|&nbsp;&nbsp;</span>

    &copy;
    {if $settings.Company.company_start_year && $smarty.const.TIME|date_format:"%Y" != $settings.Company.company_start_year}
        {$settings.Company.company_start_year} -
    {/if}

    {$smarty.const.TIME|date_format:"%Y"} {$settings.Company.company_name}. &nbsp;{__("powered_by")}
    <a class="bottom-copyright" href="{$config.resources.product_url|fn_link_attach:"utm_source=Powered+by&utm_medium=referral&utm_campaign=footer&utm_content=`$config.current_host`"}" target="_blank">{__("copyright_shopping_cart", ["[product]" => $smarty.const.PRODUCT_NAME])}</a>
</div>
</p>