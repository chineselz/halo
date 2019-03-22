<#include "default.ftl">
<#include "partials/post-card.ftl">
<@default title="${options.blog_title!}" keyword="${options.seo_keywords!}" desc="${options.seo_desc!}" canonical="${options.blog_url}" body_class="home-template">
<#-- The tag above means: insert everything in this file
into the {body} of the default.hbs template -->

<#-- The big featured header, it uses blog cover image as a BG if available -->
<header class="site-header outer <#if (options.casper_general_cover!'/${themeName}/assets/images/blog-cover.jpg') != ''>" style="background-image: url(${options.casper_general_cover!'/${themeName}/assets/images/blog-cover.jpg'})<#else>no-cover</#if>">
    <div class="inner">
        <div class="site-header-content">
            <h1 class="site-title">
                <#if options.blog_logo??>
                    <img class="site-logo" src="${options.blog_logo}" alt="${options.blog_title!}" />
                <#else>
                    ${options.blog_title!}
                </#if>
            </h1>
            <h2 class="site-description">${user.userDesc!}</h2>
        </div>
        <#include "partials/site-nav.ftl">
    </div>
</header>

<#-- The main content area -->
<main id="site-main" class="site-main outer">
    <div class="inner">

        <div class="post-feed">
            <#list posts.content as post>

                <#-- The tag below includes the markup for each post - partials/post-card.hbs -->
                <@post_card post></@post_card>
            </#list>
        </div>

    </div>
</main>
</@default>
<@scripts>
    <#if posts.totalPages gt 1>
    <script>
        // maxPages is a global variable that is needed to determine
        // if we need to load more pages for the infinitescroll, or if
        // we reached the last page already.
        var maxPages = parseInt('${posts.totalPages}');
    </script>
    <script src="/${themeName}/assets/built/infinitescroll.js"></script>
    </#if>
    <#-- Ghost outputs important scripts and data with this tag - it should always be the very last thing before the closing body tag -->
    <#-- {{ghost_foot}} -->
</@scripts>
