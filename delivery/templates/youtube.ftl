<#import "/templates/system/common/crafter.ftl" as crafter />
<script src = "http://www.youtube.com/player_api"></script>

<#if modePreview>
  <style>
    .craftercms-ice-on .craftercms-youtube-plugin-container::before {
      content: '';
      position: absolute;
      display: inline-block;
      width: ${contentModel.width_s};
      height: ${contentModel.height_s};
    }
  </style>
</#if>

<#--       For this component we could display an image with the same dimensions and the url from `posterImage_s`  -->
<@crafter.div class="craftercms-youtube-plugin-container" id="${contentModel.youtubeID_s}-container">
  <#assign youtubeItemSet = contentModel.youtubeID_s?has_content />

  <#if youtubeItemSet>
    <iframe
      id="${contentModel.youtubeID_s}"
      width="${contentModel.width_s}"
      height="${contentModel.height_s}"
      src="https://www.youtube.com/embed/${contentModel.youtubeID_s}?version=3&enablejsapi=1"
      frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
      allowfullscreen>
    </iframe>
  <#elseif modePreview>
    <style>
      .crafter-youtube-no-items {
        display: none;
      }
      .craftercms-ice-on .crafter-youtube-no-items {
        display: flex;
        justify-content: center;
        align-items: center;
        background: #808080;
        color: #fff;
        font-weight: bold;
      }
    </style>

    <@crafter.div $field=contentModel
      class="crafter-youtube-no-items"
      $attributes={
        'style': 'width: ${contentModel.width_s!"100%"}; height: ${contentModel.height_s!"300px"};'
      }
    >
      No YouTube video has been selected in the component.
    </@crafter.div>
  </#if>
</@crafter.div>

<#if modePreview && youtubeItemSet>
  <script>
    let player;
    let playerState = -1; // unstarted
    let zKeyPressed = false;
    const onKeyup = (e) => {
      if (e.key === 'z') {
        zKeyPressed = false;
      }
    };
    const onKeydown = (e) => {
      if (e.key === 'z') {
        zKeyPressed = true;
      }
    };

    window.addEventListener('DOMContentLoaded', () => {
      document.addEventListener('keydown', onKeydown, false);
      document.addEventListener('keyup', onKeyup, false);
      document.querySelector('.craftercms-youtube-plugin-container').addEventListener('click',
        (e) => {
          if (zKeyPressed) {
            // if state === playing
            if (playerState === 1) {
              player.pauseVideo()
            } else {
              player.playVideo();
            }
          }
        }
      );
    });

    function onYouTubeIframeAPIReady() {
      player = new YT.Player('${contentModel.youtubeID_s}', {
        events: {
          'onStateChange': (event) => {
            playerState = event.data;
          }
        }
      });
    }

  </script>
</#if>