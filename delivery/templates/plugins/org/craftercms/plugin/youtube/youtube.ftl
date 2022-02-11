<#--
  ~ MIT License
  ~
  ~ Copyright (c) 2018-2022 Crafter Software Corporation. All Rights Reserved.
  ~
  ~ Permission is hereby granted, free of charge, to any person obtaining a copy
  ~ of this software and associated documentation files (the "Software"), to deal
  ~ in the Software without restriction, including without limitation the rights
  ~ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  ~ copies of the Software, and to permit persons to whom the Software is
  ~ furnished to do so, subject to the following conditions:
  ~
  ~ The above copyright notice and this permission notice shall be included in all
  ~ copies or substantial portions of the Software.
  ~
  ~ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  ~ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  ~ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  ~ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  ~ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  ~ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  ~ SOFTWARE.
  -->

<#import "/templates/system/common/crafter.ftl" as crafter />

<#if modePreview>
<style>
  .youtube-no-video-selected {
    display: none;
  }
  .craftercms-ice-on .youtube-no-video-selected {
    display: flex;
    justify-content: center;
    align-items: center;
    background: #f2f2f2;
    color: #000;
    font-weight: bold;
  }
</style>
</#if>

<#-- For this component we could display an image with the same dimensions and the url from `posterImage_s` -->
<@crafter.div class="youtube-plugin-container">
  <#assign youtubeItemSet = contentModel.youtubeID_s?has_content />
  <#if youtubeItemSet>
    <@crafter.iframe
      $model=""
      width="${contentModel.width_s}"
      height="${contentModel.height_s}"
      src="https://www.youtube.com/embed/${contentModel.youtubeID_s}"
      style="border: none"
      allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; fullscreen"
    />
  <#elseif modePreview>
    <div
      class="youtube-no-video-selected"
      style="width: ${contentModel.width_s!'100%'}; height: ${contentModel.height_s!'300px'};"
    >
      No YouTube video has been selected in the component.
    </div>
  </#if>
</@crafter.div>
