<#import "template.ftl" as layout>
<div class="external-container display-column">
    <div class=" content-container display-row">
        <!--LEFT SIDE -- Back button and team component-->
        <div class="content-left-container display-column">

            <div class="header">

                <#-- Logo-->
                <img src="${url.resourcesPath}/img/rokrLogo.png" alt="rokr logo" class="logo">

                <#-- Greetings -->
                <div class="text-large-bold">
                    ${msg('greetings')}
                </div>

                <#-- welcome message -->
                <div class="text-small">
                    ${msg('welcome-message')}
                </div>

                <#-- form -->
                <@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
                <#if section = "form">
                <div class="text-small"
                     <#if realm.password && social.providers??>class="${properties.kcContentWrapperClass!}"</#if>>
                    <div <#if realm.password && social.providers??>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                        <#if realm.password>
                        <form onsubmit="login.disabled = true; return true;"
                              action="${url.loginAction}"
                              method="post">

                            <#--Username text and input-->
                            <div class="${properties.kcFormGroupClass!}">
                                <div class="input-text">
                                    <label for="username"
                                           class="${properties.kcLabelClass!}">${msg("username")}
                                    </label>
                                </div>

                                <div>
                                    <#if usernameEditDisabled??>
                                        <input tabindex="1" id="username" class="${properties.kcInputClass!}"
                                               name="username"
                                               value="${(login.username!'')}" type="text" disabled/>
                                    <#else>
                                        <input tabindex="1" id="username" class="${properties.kcInputClass!}"
                                               name="username"
                                               value="${(login.username!'')}" type="text" autofocus
                                               autocomplete="off"/>
                                    </#if>
                                </div>
                            </div>

                            <#-- Password text and input-->
                            <div class="${properties.kcFormGroupClass!}">
                                <div class="input-text">
                                    <label for="password" class="${properties.kcLabelClass!}">
                                        ${msg("password")}
                                    </label>
                                </div>
                                <div id="input-password">
                                    <input tabindex="2" id="password" class="${properties.kcInputClass!}"
                                           name="password"
                                           type="password" autocomplete="off"/>
                                </div>
                            </div>

                            <#-- Passcode text and input-->
                            <#--<div class="${properties.kcFormGroupClass!}">
                                <div class="input-text">
                                    <label for="passcode"
                                           class="${properties.kcLabelClass!}">Passcode
                                    </label>
                                </div>

                                <div>
                                    <#if usernameEditDisabled??>
                                        <input tabindex="3" id="passcode" class="${properties.kcInputClass!}"
                                               name="passcode"
                                               value="${(login.username!'')}" type="text" disabled/>
                                    <#else>
                                        <input tabindex="3" id="passcode" class="${properties.kcInputClass!}"
                                               name="passcode"
                                               value="${(login.username!'')}" type="text" autofocus
                                               autocomplete="off"/>
                                    </#if>
                                </div>
                            </div>-->

                            <#-- Remember me text and checkbox -->
                            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                                <div>
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                        <div class="checkbox">
                                            <label>
                                                <#if login.rememberMe??>
                                                    <input tabindex="4" id="rememberMe" name="rememberMe"
                                                           type="checkbox"
                                                           checked> ${msg("rememberMe")}
                                                <#else>
                                                    <input tabindex="4" id="rememberMe" name="rememberMe"
                                                           type="checkbox"> ${msg("rememberMe")}
                                                </#if>
                                            </label>
                                        </div>
                                    </#if>
                                </div>
                            </div>

                            <#-- Error message if there is one -->
                            <div class="text-small-bold error-message">
                                <#if message?has_content>
                                    ${message.summary}
                                </#if>
                            </div>

                            <#-- Login button-->
                            <div id="kc-form-buttons" class="${properties.kcFormGroupClass!} display-column">
                                <input tabindex="5"
                                       class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                       name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                            </div>

                            <#-- Forgot password -->
                            <div class="${properties.kcFormOptionsWrapperClass!}" id="forgot-password">
                                <#if realm.resetPasswordAllowed>
                                    <a class="forgot-password-text" tabindex="6"
                                       href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>

                        </form>
                    </div>
                    </#if>
                    <#if realm.password && social.providers??>
                        <div id="kc-social-providers"
                             class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                            <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                                <#list social.providers as p>
                                    <li class="${properties.kcFormSocialAccountListLinkClass!}"><a
                                                href="${p.loginUrl}"
                                                id="zocial-${p.alias}"
                                                class="zocial ${p.providerId}">
                                            <span>${p.displayName}</span></a></li>
                                </#list>
                            </ul>
                        </div>
                    </#if>
                </div>
            </div>

            <#elseif section = "info" >
                <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                    <div id="kc-registration">
                            <span>${msg("noAccount")} <a tabindex="6"
                                                         href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                    </div>
                </#if>
            </#if>
            </@layout.registrationLayout>
        </div>

        <!--RIGHT SIDE-->
        <div class="content-right-container">
            <#-- Define language -->
            <header class="${properties.kcFormHeaderClass!}">
                <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                    <div class="${properties.kcLocaleWrapperClass!}">
                        <div class="dropdown text-small">
                            <div class="dropbtn display-row">
                                <span class="chosen-language">${locale.current}</span>
                                <img src="${url.resourcesPath}/img/arrow-down.svg" alt="arrow down"
                                     class="img-arrow-down">
                            </div>
                            <div class="dropdown-content">
                                <#list locale.supported as l>
                                    <a href="${l.url}">${l.label}</a>
                                </#list>
                            </div>
                        </div>
                    </div>
                </#if>
            </header>

            <div class="large-logo-position display-column">
                <img src="${url.resourcesPath}/img/rokrLogo.png" alt="rokr logo">
            </div>

        </div>
        <div class="display-row text-x-small"
             style="width: 100%; background-color: var(--color-lightgrey); align-items: center">
            <div class="content-left-container rights">
                © 2020 by msg systems ag
            </div>
            <div class="rokr-footer display-row">
                <div class="footer-padding text-x-small-bold">${msg("give-feedback")}</div>
                <div>|</div>
                <div class="footer-padding">${msg("terms-of-service")}</div>
                <div>|</div>
                <div class="footer-padding">${msg("privacy-policy")}</div>
                <div>|</div>
                <div class="footer-padding">${msg("security-policy")}</div>
                <div>|</div>
                <div class="footer-padding">${msg("content-policy")}</div>
                <div>|</div>
                <div class="footer-padding">${msg("imprint")}</div>
            </div>
        </div>
    </div>

</div>
