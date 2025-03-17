{** block-description:tmpl_copyright **}
<style>
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

<div style="display:none;" class="back-to" id="toolBackTop">
    <a title="返回顶部" onclick="window.scrollTo(0,0);return false;" href="#top" class="back-top"></a>
</div>

<script>
    $(function () {
        var bt = $('#toolBackTop');
        var sw = $(document.body)[0].clientWidth;

        var limitsw = (sw - 840) / 2 - 80;  //距离右侧距离
        if (limitsw > 0) {
            limitsw = parseInt(limitsw);
            bt.css("right", limitsw / 8);
        }

        $(window).scroll(function () {
            var st = $(window).scrollTop();
            if (st > 30) {
                bt.show();
            } else {
                bt.hide();
            }
        });
    });

</script>
<p>
    <div class="bottom-copyright">
    <a class="bottom-copyright" href="/index.php" target="_blank">{__("icp_beian")}</a>
    <span class="bottom-copyright">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
    <a class="bottom-copyright" href="/index.php" target="_blank">{__("drug_medical_device_filing")}</a>
    <span class="bottom-copyright">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
    <a class="bottom-copyright" href="/index.php" target="_blank">{__("medical_device_business")}</a>
    <span class="bottom-copyright">&nbsp;&nbsp;|&nbsp;&nbsp;</span>
    <a class="bottom-copyright" href="/index.php" target="_blank">{__("publication_license")}</a>
    <span class="bottom-copyright">&nbsp;&nbsp;|&nbsp;&nbsp;</span>

    &copy;
    {if $settings.Company.company_start_year && $smarty.const.TIME|date_format:"%Y" != $settings.Company.company_start_year}
        {$settings.Company.company_start_year} -
    {/if}

    {$smarty.const.TIME|date_format:"%Y"} {$settings.Company.company_name}. &nbsp;{__("powered_by")}
    <a class="bottom-copyright" href="{$config.resources.product_url|fn_link_attach:"utm_source=Powered+by&utm_medium=referral&utm_campaign=footer&utm_content=`$config.current_host`"}" target="_blank">{__("copyright_shopping_cart", ["[product]" => $smarty.const.PRODUCT_NAME])}</a>
</div>
</p>