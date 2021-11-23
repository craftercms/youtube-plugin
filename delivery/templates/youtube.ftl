<#import "/templates/system/common/crafter.ftl" as crafter />

<#if modePreview>
<style>
  .youtube-no-video-selected {
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
</#if>

<#-- For this component we could display an image with the same dimensions and the url from `posterImage_s` -->
<@crafter.div class="youtube-plugin-container">
  <#assign youtubeItemSet = contentModel.youtubeID_s?has_content />
  <#if youtubeItemSet>
    <@crafter.eventCaptureOverlay>
      <iframe
        width="${contentModel.width_s}"
        height="${contentModel.height_s}"
        src="https://www.youtube.com/embed/${contentModel.youtubeID_s}"
        style="border: none"
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen
      ></iframe>
    </@crafter.eventCaptureOverlay>
  <#elseif modePreview>
    <div
      class="youtube-no-video-selected"
      style="width: ${contentModel.width_s!'100%'}; height: ${contentModel.height_s!'300px'};"
    >
      No YouTube video has been selected in the component.
    </div>
  </#if>
</@crafter.div>
