<?php echo $header; ?>
<div class="page-inside-bg" style="background: url('<?php echo $thumb; ?>')no-repeat center;"></div>
<div class="contacts-wrap clearfix">
  <ul class="breadcrumbs mg0">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
    <?php if($i+1<count($breadcrumbs)) { ?><li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> <span>-</span></li><?php } else { ?>
    <li><?php echo $breadcrumb['text']; ?></li><?php } ?>
    <?php } ?>
  </ul>
  <div class="page-inside-content page-inside-content-information">
    <h1><?php echo $heading_title; ?></h1>

    <div class="page-inside-text">
      <?php echo $description; ?>
    </div>
  </div>
</div>
<div class="clearfix"></div>
<?php echo $footer; ?>