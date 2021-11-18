<#import "/templates/system/common/crafter.ftl" as crafter />

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
<#assign id = 'c' + contentModel.objectId?replace('-', '') />
<@crafter.div class="craftercms-youtube-plugin-container" id="${id}-container">
  <#assign youtubeItemSet = contentModel.youtubeID_s?has_content />

  <#if youtubeItemSet>
    <iframe
      id="${id}"
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
    if (YT && YT.Player) {
      // If YouTube player API is initialized
      crafterYoutube.initPlayer('${id}');
    } else {
      // If YouTube player API is not initialized:
      // The YouTube player API looks for a function called `onYouTubeIframeAPIReady` and calls it when ready. So it can't
      // be renamed or put on a closure, so a list of videos ids is created, and when ready it can initialize all of them.
      window.crafterYoutubeVideosIds = window.crafterYoutubeVideosIds ?? [];
      crafterYoutubeVideosIds.push('${id}');

      function onYouTubeIframeAPIReady() {
        crafterYoutubeVideosIds.forEach((id) => crafterYoutube.initPlayer(id));
      }
    }
  </script>
</#if>