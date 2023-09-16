<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>

<!-- 헤더 시작 -->
<jsp:include page="../setting/header.jsp" />
<!-- 헤더 끝 -->

<!-- 배너 영역 시작 -->
<section class="page-title background-primary is-relative">
    <div class="container">
        <div class="has-text-centered">
            <h1 class="has-text-white font-tertiary" style="font-size: 40px;"> 공지사항 상세보기 </h1>
        </div>
    </div>
    <img src="${path}/resources/images/bannerPage.jpg" alt="bannerImage">
</section>
<!-- 배너 영역 끝 -->

<section class="section">
    <div class="container">
        <div class="columns is-desktop is-justify-content-center">
            <div class="column is-10-desktop">
                <div class="p-6 shadow rounded content">
                    <h1>Changelog posts</h1>
                    <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt dolore
                        magna aliquyam erat, sed diam voluptua. At vero eos et ustoLorem ipsum dolor sit amet, consetetur.</p>
                    <div class="mt-6">

                        <!-- changelog post -->
                        <h3 id="february-updates">February Updates</h3>
                        <p><strong>Feb 6, 2019</strong></p>
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt
                            dolore
                            magna aliquyam erat, sed diam voluptua. At vero eos et ustoLorem ipsum dolor sit amet,
                            consetetur.&rdquo;
                        </p>
                        <div class="mt-5">
                            <div class="badge changed">Changed</div>
                            <ul>
                                <li>
                                    <p>Better support for using applying additional filters to posts_tax_query for categories for
                                        custom
                                        WordPress syncs</p>
                                </li>
                                <li>
                                    <p>Reporting fine-tuning for speed improvements (up to 60% improvement in latency)</p>
                                </li>
                                <li>
                                    <p>Replaced login / registration pre-app screens with a cleaner design</p>
                                </li>
                            </ul>
                        </div>
                        <div class="mt-5">
                            <div class="badge removed">Removed</div>
                            <ul>
                                <li>Removed an issue with the sync autolinker only interlinking selectively.</li>
                                <li>Removed up an issue with prematurely logging out users</li>
                            </ul>
                        </div>

                        <hr>

                        <!-- changelog post -->
                        <h3 id="march-updates">March Updates</h3>
                        <p><strong>Mar 6, 2019</strong></p>
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor <br>
                            invidunt
                            dolore magna aliquyam erat, sed diam voluptua. At vero eos et ustoLorem ipsum dolor sit amet,
                            consetetur.&rdquo;</p>
                        <div class="mt-5">
                            <div class="badge added">Added</div>
                            <ul>
                                <li>Some scheduled changelogs, tweets, and slack messages queued up this weekend and were not
                                    published
                                    on time. We fixed the issue and all delayed publications should be out.</li>
                                <li>We now prioritize keywords over title and body so customers can more effectively influence
                                    search
                                    results</li>
                                <li>Support form in the Assistant is now protected with reCaptcha to reduce spam
                                    reinitializeOnUrlChange
                                    added to the JavaScript API to improve support for pages with turbolinks</li>
                            </ul>
                        </div>
                        <div class="mt-5">
                            <div class="badge fixed">Fixed</div>
                            <ul>
                                <li>Fixed an issue with the sync autolinker only interlinking selectively.</li>
                                <li>Fixed up an issue with prematurely logging out users</li>
                            </ul>
                        </div>

                        <hr>

                        <!-- changelog post -->
                        <h3 id="changelog-label">Changelog label</h3>
                        <div class="mt-5">
                            <div class="badge added">Added</div>
                        </div>
                        <div class="mt-5">
                            <div class="badge changed">Changed</div>
                        </div>
                        <div class="mt-5">
                            <div class="badge depricated">Depricated</div>
                        </div>
                        <div class="mt-5">
                            <div class="badge removed">Removed</div>
                        </div>
                        <div class="mt-5">
                            <div class="badge fixed">Fixed</div>
                        </div>
                        <div class="mt-5">
                            <div class="badge security">Security</div>
                        </div>
                        <div class="mt-5">
                            <div class="badge unreleased">Unreleased</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 푸터 시작 -->
<jsp:include page="../setting/footer.jsp" />
<!-- 푸터 끝 -->

</body>
</html>