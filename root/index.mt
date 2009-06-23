? if ($c->user) {

<form method="post">
  <p>
    <label for="message">メッセージ:</label>
    <textarea id="message" name="message"></textarea>
  </p>
  <p><input type="submit" value="投稿"/></p>
</form>

? } else {

<p>メッセージを投稿するには<a href="<?= $c->uri_for('/login') ?>">ログイン</a>が必要です。</p>

? }


? while (my $msg = $s->{messages}->next) {

<hr />

<dl>
  <dt>ID:</dt>
  <dd><?= $msg->user ?></dd>
  <dt>Date:</dt>
  <dd><?= $msg->created_date ?></dd>
  <dt>Body:</dt>
  <dd><?= $msg->body ?></dd>
</dl>

? }
