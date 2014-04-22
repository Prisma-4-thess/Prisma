<div id="timelineContainer" class="timelineContainer">
    <div class="timelineMajor">
        <h2 class="timelineMajorMarker">
            ${dec?.ada}
        </h2>
        <g:each in="${simDec}">
            <dl class="timelineMinor">
                <dt id="${it?.ada}">
                    <a>
                        ${it?.ada}
                    </a>

                </dt>
                <dd class="timelineEvent" id="${it?.ada + "EX"}"
                    style="display: none;">
                    <p>
                        <g:formatDate date="${it?.date}"/>

                    </p>

                    <p>
                        ${it?.subject}
                    </p>

                  <p class="more">
                        <g:link controller="search" action="show"
                                id="${it?.id}" params="['source': 'similar']"
                                style="display:block" target="_blank">Περισσότερα...</g:link>
                  </p>
                </dd>
                <!-- /.timelineEvent -->
            </dl>
        </g:each>

    </div>
    <script type="text/javascript"
            src="${resource(dir: 'js', file: 'timeliner.js')}"></script>
    <script>
        $(document).ready(function () {
            $.timeliner({
                timelineContainer: '#timelineContainer'
            });
        });
    </script>
    <!-- /.timelineMajor -->
</div>
<!-- /#timelineContainer -->
