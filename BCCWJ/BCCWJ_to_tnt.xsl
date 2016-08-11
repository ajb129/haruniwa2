<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

<!--
N                 名詞-普通名詞-一般
N                 名詞-普通名詞-サ変可能
N                 名詞-普通名詞-形状詞可能
N                 名詞-普通名詞-サ変形状詞可能
N                 名詞-普通名詞-副詞可能
NUMCL             名詞-普通名詞-助数詞可能
NPR               名詞-固有名詞-一般
NPR               名詞-固有名詞-人名-一般
NPR               名詞-固有名詞-人名-姓
NPR               名詞-固有名詞-人名-名
NPR               名詞-固有名詞-地名-一般
NPR               名詞-固有名詞-地名-国
CARD              名詞-数詞
ADV               名詞-助動詞語幹
PRO/WPRO          代名詞
ADJN              形状詞-一般
ADJT              形状詞-タリ
ADV               形状詞-助動詞語幹
D/WD              連体詞
ADV/WADV          副詞
CONJ              接続詞
INTJ              感動詞-一般
INTJ              感動詞-フィラー
VB                動詞-一般
VB2               動詞-非自立可能
ADJI              形容詞-一般
AX/MD/NEG         形容詞-非自立可能
AX/AXD/VB2/NEG/MD 助動詞
P-CASE            助詞-格助詞
P-CASE            助詞-副助詞
P-OPTR            助詞-係助詞
P-CONJ            助詞-接続助詞
P-FINAL           助詞-終助詞
P-FINAL           助詞-準体助詞
PREFIX            接頭辞
SUFFIX            接尾辞-名詞的-一般
SUFFIX            接尾辞-名詞的-サ変可能
SUFFIX            接尾辞-名詞的-形状詞可能
SUFFIX            接尾辞-名詞的-サ変形状詞可能
SUFFIX            接尾辞-名詞的-副詞可能
SUFFIX/NUMCL      接尾辞-名詞的-助数詞
SUFFIX            接尾辞-形状詞的
SUFFIX            接尾辞-動詞的
SUFFIX            接尾辞-形容詞的
SYM               記号-一般
SYM               記号-文字
SYM/PU/CARD       補助記号-一般
PU                補助記号-句点
PU                補助記号-読点
-LRB-             補助記号-括弧開
-RRB-             補助記号-括弧閉
PU                補助記号-AA-一般
PU                補助記号-AA-顔文字
FW                未知語 英単語
                  空白
-->

<xsl:template match="/">
  <xsl:for-each select="//sentence">

<!-- %%%%%%%%%%%%%%%%%%%%%%%% -->
<!-- % long-unit word level % -->
<!-- %%%%%%%%%%%%%%%%%%%%%%%% -->

    <xsl:for-each select="LUW">
      <xsl:choose>
        <!-- nouns -->
        <xsl:when test="@l_pos = '名詞-普通名詞-一般' and not(NumTrans) and not(SUW/@pos = '名詞-数詞') and not(SUW/@pos = '感動詞-フィラー') and not(SUW/@pos = '名詞-普通名詞-サ変可能' and following-sibling::LUW[1]/@l_lForm = '。') and not(SUW/@pos = '接続詞')">
          <xsl:choose>
            <xsl:when test="@l_lemma = '幾ら'">
              <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '自分' or @l_lemma = '自身'">
              <xsl:value-of select="."/><xsl:text>	PRO
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '多く' or @l_lemma = '皆' or @l_lemma = '両方'">
              <xsl:value-of select="."/><xsl:text>	Q
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '半分'">
              <xsl:value-of select="."/><xsl:text>	Q
</xsl:text>
            </xsl:when>
            <xsl:when test="starts-with(., '全')">
              <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
            </xsl:when>
            <xsl:when test="starts-with(., '両') and not(starts-with(., '両親')) and not(starts-with(., '両耳'))">
              <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
            </xsl:when>
            <xsl:when test="starts-with(., '各')">
              <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
            </xsl:when>
            <xsl:when test="starts-with(., '毎')">
              <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
            </xsl:when>
            <xsl:when test="@lemma = '半' or @l_lemma = '一人' or @l_lemma = '二人'">
              <xsl:value-of select="."/><xsl:text>	CARD
</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <!-- noun for CSJ -->
        <xsl:when test="@l_pos = '名詞'">
          <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
        </xsl:when>

        <!-- proper nouns -->
        <xsl:when test="@l_pos = '名詞-固有名詞-一般'">
          <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '名詞-固有名詞-人名-一般'">
          <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '名詞-固有名詞-人名-姓'">
          <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '名詞-固有名詞-人名-名'">
          <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '名詞-固有名詞-地名-一般'">
          <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '名詞-固有名詞-地名-国'">
          <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
        </xsl:when>
        <!-- proper name for CSJ -->
        <xsl:when test="@l_pos = '名詞-固有名詞'">
          <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
        </xsl:when>

        <!-- adverb? -->
        <xsl:when test="@l_pos = '名詞-助動詞語幹'">
          <xsl:value-of select="."/><xsl:text>	ADV
</xsl:text>
        </xsl:when>

        <!-- pronoun -->
        <xsl:when test="@l_pos = '代名詞'">
          <xsl:choose>
            <xsl:when test="@l_lemma = '何れ' or SUW/@lemma = '何れ'">
              <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '何時' or SUW/@lemma = '何時'">
              <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '誰' or SUW/@lemma = '誰'">
              <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '何処' or SUW/@lemma = '何処'">
              <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '何方' or SUW/@lemma = '何方'">
              <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '何' or SUW/@lemma = '何'">
              <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/><xsl:text>	PRO
</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>

        <xsl:when test="@l_pos = '形状詞-一般' and @l_lemma = 'どんな'">
          <xsl:value-of select="."/><xsl:text>	WADV
</xsl:text>
        </xsl:when>

        <!-- adjective -->
        <xsl:when test="@l_pos = '形状詞-一般'">
          <xsl:value-of select="."/><xsl:text>	ADJN
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '形状詞-タリ'">
          <xsl:value-of select="."/><xsl:text>	ADJT
</xsl:text>
        </xsl:when>

        <!-- adjective for CSJ -->
        <xsl:when test="@l_pos = '形状詞'">
          <xsl:choose>
            <xsl:when test="@l_lemma = '様'">
              <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/><xsl:text>	ADJN
</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>

        <!-- みたい, よう and そう -->
        <xsl:when test="@l_pos = '形状詞-助動詞語幹'">
          <xsl:choose>
            <xsl:when test="@l_lemma = 'そう'">
              <xsl:value-of select="."/><xsl:text>	ADV
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = 'そう-様態'">
              <xsl:value-of select="."/><xsl:text>	ADV
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = 'みたい'">
              <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>

        <!-- determiner -->
        <xsl:when test="@l_pos = '連体詞'">
          <xsl:choose>
            <xsl:when test="@l_lemma = '如何なる'">
              <xsl:value-of select="."/><xsl:text>	WD
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '何の'">
              <xsl:value-of select="."/><xsl:text>	WD
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = 'どんな'">
              <xsl:value-of select="."/><xsl:text>	WD
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '大きな' or @l_lemma = '小さな' or @l_lemma = '同じ'">
              <xsl:value-of select="."/><xsl:text>	ADJN
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '我が'">
              <xsl:value-of select="."/><xsl:text>	PRO
</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/><xsl:text>	D
</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>

        <!-- adverb -->
        <xsl:when test="@l_pos = '副詞'">
          <xsl:choose>
            <xsl:when test="@l_lemma = '幾ら'">
              <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = 'どう' or @l_lemma = 'どうして' or @l_lemma = 'なぜ' or @l_lemma = 'いかが' or @l_lemma = '如何に' or @l_lemma = 'どんなに' or @l_lemma = '何で' or @l_lemma = 'どのように' or @l_lemma = 'なんで' or @l_lemma = '如何' or @l_lemma = '何故' or @l_lemma = 'どー' or @l_lemma = 'どんな'">
              <xsl:value-of select="."/><xsl:text>	WADV
</xsl:text>
            </xsl:when>
            <xsl:when test="@l_lemma = '大体' or @l_lemma = '時々' or @l_lemma = '殆ど'">
              <xsl:value-of select="."/><xsl:text>	ADV
</xsl:text>
            </xsl:when>

            <xsl:when test="@l_lemma = '最近' or @l_lemma = '週末'">
              <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
            </xsl:when>

            <xsl:when test="SUW/@pos = '名詞-普通名詞-副詞可能' and (contains(SUW/@lemma, '日') or contains(SUW/@lemma, '月') or contains(SUW/@lemma, '年') or contains(SUW/@lemma, '今') or contains(SUW/@lemma, '朝') or contains(SUW/@lemma, '時') or contains(SUW/@lemma, '昨') or contains(SUW/@lemma, '来') or contains(SUW/@lemma, '昔'))">
              <xsl:choose>
                <xsl:when test="starts-with(., '全')">
                  <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                </xsl:when>
                <xsl:when test="starts-with(., '両') and not(starts-with(., '両親')) and not(starts-with(., '両耳'))">
                  <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                </xsl:when>
                <xsl:when test="starts-with(., '各')">
                  <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                </xsl:when>
                <xsl:when test="starts-with(., '毎')">
                  <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/><xsl:text>	ADV
</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>

        <!-- conjunction -->
        <xsl:when test="@l_pos = '接続詞'">
          <xsl:value-of select="."/><xsl:text>	CONJ
</xsl:text>
        </xsl:when>

        <!-- interjection -->
        <xsl:when test="@l_pos = '感動詞-一般'">
          <xsl:value-of select="."/><xsl:text>	INTJ
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '感動詞-フィラー'">
          <xsl:value-of select="."/><xsl:text>	INTJ
</xsl:text>
        </xsl:when>
        <!-- interjection for CSJ -->
        <xsl:when test="@l_pos = '感動詞'">
          <xsl:value-of select="."/><xsl:text>	INTJ
</xsl:text>
        </xsl:when>

        <!-- verb, verbal noun -->
        <xsl:when test="@l_pos = '動詞-一般' and SUW[last()]/@pos = '動詞-非自立可能' and SUW[last()]/@lemma = '為る' and child::SUW[last() &gt; 1]">
          <xsl:for-each select="child::SUW[position() != last()]">
            <xsl:value-of select="."/><xsl:text>	VB;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>する
</xsl:text>
          </xsl:for-each>
          <xsl:value-of select="SUW[last()]/."/><xsl:text>	VB0
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '動詞-一般' and SUW[last()]/@pos = '動詞-非自立可能' and SUW[last()]/@lemma = '致す' and child::SUW[last() &gt; 1]">
          <xsl:for-each select="child::SUW[position() != last()]">
            <xsl:value-of select="."/><xsl:text>	VB;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>する
</xsl:text>
          </xsl:for-each>
          <xsl:value-of select="SUW[last()]/."/><xsl:text>	VB0
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '動詞-一般' and SUW[last()]/@pos = '動詞-非自立可能' and SUW[last()]/@lemma = '出来る' and child::SUW[last() &gt; 1]">
          <xsl:for-each select="child::SUW[position() != last()]">
            <xsl:value-of select="."/><xsl:text>	VB;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>する
</xsl:text>
          </xsl:for-each>
          <xsl:value-of select="SUW[last()]/."/><xsl:text>	VB0
</xsl:text>
        </xsl:when>

        <!-- volitional verb -->
        <xsl:when test="@l_pos = '動詞-一般' and @l_cForm = '意志推量形'">
            <xsl:value-of select="."/><xsl:text>	VB-VOL;</xsl:text><xsl:value-of select="@l_lemma"/><xsl:text>
</xsl:text>
        </xsl:when>

        <xsl:when test="@l_pos = '動詞-一般' and not(SUW/@pos = '動詞-非自立可能')">
            <xsl:value-of select="."/><xsl:text>	VB;</xsl:text><xsl:value-of select="@l_lemma"/><xsl:text>
</xsl:text>
        </xsl:when>

        <!-- adjective -->
        <xsl:when test="@l_pos = '形容詞-一般' and not(SUW[1]/@pos = '動詞-一般' and SUW[last()]/@pos = '接尾辞-形容詞的') and not(SUW[1]/@pos = '動詞-非自立可能' and SUW[last()]/@pos = '接尾辞-形容詞的')">
          <xsl:choose>
            <xsl:when test="@l_lemma = '無い'">
              <xsl:value-of select="."/><xsl:text>	NEG
</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="."/><xsl:text>	ADJI
</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <!-- adjective for CSJ -->
        <xsl:when test="@l_pos = '形容詞'">
          <xsl:value-of select="."/><xsl:text>	ADJI
</xsl:text>
        </xsl:when>

        <!-- particle ので -->
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'のだ' and SUW/. = 'の' and SUW/. = 'で'">
          <xsl:value-of select="."/><xsl:text>	P-CONJ
</xsl:text>
        </xsl:when>

        <!-- particle なら -->
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'だ' and SUW/. = 'なら'">
          <xsl:value-of select="."/><xsl:text>	P-CONJ
</xsl:text>
        </xsl:when>

        <!-- particle たら -->
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'た' and (SUW/. = 'たら' or SUW/. = 'だら')">
          <xsl:value-of select="."/><xsl:text>	P-CONJ
</xsl:text>
        </xsl:when>

        <!-- VB -->
        <xsl:when test="@l_pos = '助動詞' and (@l_lemma = 'せる' or @l_lemma = 'させる')">
          <xsl:value-of select="."/><xsl:text>	VB2;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
        </xsl:when>

        <!-- particle -->
        <xsl:when test="@l_pos = '助動詞' and @l_cForm = '連用形-ニ' and preceding-sibling::*[1]/@l_lForm='ヨウ'">
          <xsl:value-of select="."/><xsl:text>	P-CASE
</xsl:text>
        </xsl:when>

        <!-- modal with AX -->

        <xsl:when test="@l_lemma='である' and @l_pos = '助動詞' and SUW[1]/. = 'で' and SUW[2]/. = 'あろう'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>

        <xsl:when test="@l_lemma='のです' and @l_pos = '助動詞' and SUW[1]/. = 'の' and SUW[2]/. = 'でしょう'">
<xsl:text>の	P-NOUN
でしょ	AX
う	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_lemma='のです' and @l_pos = '助動詞' and SUW[1]/. = 'ん' and SUW[2]/. = 'でしょう'">
<xsl:text>ん	P-NOUN
でしょ	AX
う	MD
</xsl:text>
        </xsl:when>

        <!-- modal -->
        <xsl:when test="@l_pos = '助動詞' and SUW/. = 'だろう' and not(SUW[1]/@lemma = 'の')">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and SUW/. = 'でしょう'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'なければならない'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'かもしれない'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'かもしれません'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'らしい'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'てもいい'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'てはいけない'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'てはならない'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'ねばならない'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'までもない'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'に違いない'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'わけにはいかない'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'ざるを得ない'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'ばいい'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>

        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'まじ'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>

        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'べし'">
          <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
        </xsl:when>


<!-- list of MD stops here -->

        <xsl:when test="@l_pos = '助動詞' and @l_lemma = 'つつある'">
          <xsl:value-of select="."/><xsl:text>	AX
</xsl:text>
        </xsl:when>


        <!-- particle, のに -->
        <xsl:when test="@l_pos = '助詞-格助詞' and @l_lForm='ニ' and preceding-sibling::LUW[1]/@l_pos = '助詞-準体助詞' and preceding-sibling::LUW[1]/@l_lForm = 'ノ'">
          <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
        </xsl:when>

        <!-- particle, case -->
        <xsl:when test="@l_pos = '助詞-格助詞'">
          <xsl:value-of select="."/><xsl:text>	P-CASE
</xsl:text>
        </xsl:when>
        <!-- particle, adverbial -->
        <xsl:when test="@l_pos = '助詞-副助詞' and @l_lemma = 'や'">
          <xsl:value-of select="."/><xsl:text>	P-COORD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助詞-副助詞' and @l_lemma = 'だけ'">
          <xsl:value-of select="."/><xsl:text>	P-OPTR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助詞-副助詞' and @l_lemma = 'たり'">
          <xsl:value-of select="."/><xsl:text>	P-OPTR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助詞-副助詞' and @l_lemma = 'など'">
          <xsl:value-of select="."/><xsl:text>	P-OPTR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助詞-副助詞' and @l_lemma = 'か'">
          <xsl:value-of select="."/><xsl:text>	P-OPTR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助詞-副助詞' and @l_lemma = 'しか'">
          <xsl:value-of select="."/><xsl:text>	P-OPTR
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助詞-副助詞'">
          <xsl:value-of select="."/><xsl:text>	P-CASE
</xsl:text>
        </xsl:when>
        <!-- particle, operator -->
        <xsl:when test="@l_pos = '助詞-係助詞'">
          <xsl:value-of select="."/><xsl:text>	P-OPTR
</xsl:text>
        </xsl:when>

        <!-- split particle -->
        <xsl:when test="@l_pos = '助詞-接続助詞' and @l_lemma='ために' and SUW[1]/. = 'ため' and SUW[2]/. = 'に'">
<xsl:text>ため	N
に	P-CASE
</xsl:text>
        </xsl:when>

        <!-- particle, conjunctive -->
        <xsl:when test="@l_pos = '助詞-接続助詞' and @l_lemma='が'">
          <xsl:value-of select="."/><xsl:text>	P-COORD
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助詞-接続助詞'">
          <xsl:value-of select="."/><xsl:text>	P-CONJ
</xsl:text>
        </xsl:when>
        <!-- particle, sentence-ending -->
        <xsl:when test="@l_pos = '助詞-終助詞'">
          <xsl:value-of select="."/><xsl:text>	P-FINAL
</xsl:text>
        </xsl:when>
        <!-- particle, のに -->
        <xsl:when test="@l_pos = '助詞-準体助詞' and following-sibling::LUW[1]/@l_pos = '助詞-格助詞' and following-sibling::LUW[1]/@l_lForm = 'ニ'">
          <xsl:value-of select="."/><xsl:text>	P-CONJ
</xsl:text>
        </xsl:when>
        <!-- particle, の -->
        <xsl:when test="@l_pos = '助詞-準体助詞' and following-sibling::LUW[1]/@l_pos = '助詞-格助詞'">
          <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助詞-準体助詞' and @l_lemma = 'の'">
          <xsl:value-of select="."/><xsl:text>	P-NOUN
</xsl:text>
        </xsl:when>
        <xsl:when test="@l_pos = '助詞-準体助詞'">
          <xsl:value-of select="."/><xsl:text>	P-FINAL
</xsl:text>
        </xsl:when>

        <!-- spaces -->
        <xsl:when test="@l_pos = '空白'">
        </xsl:when>

<!-- %%%%%%%%%%%%%%%%%%%%%%%%% -->
<!-- % short-unit word level % -->
<!-- %%%%%%%%%%%%%%%%%%%%%%%%% -->

        <xsl:otherwise>
          <xsl:for-each select="SUW | NumTrans">
            <xsl:choose>

              <!-- nouns -->
              <xsl:when test="@pos = '名詞-普通名詞-一般'">
                <xsl:choose>
                  <xsl:when test="@lForm = 'テン' and following-sibling::*[1]/@pos = '名詞-数詞'">
                    <xsl:value-of select="."/><xsl:text>	CARD
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '多く' or @lemma = '皆'">
                    <xsl:value-of select="."/><xsl:text>	Q
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '半' or @l_lemma = '一人' or @l_lemma = '二人'">
                    <xsl:value-of select="."/><xsl:text>	CARD
</xsl:text>
                  </xsl:when>
                  <xsl:when test="starts-with(., '全')">
                    <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                  </xsl:when>
                  <xsl:when test="starts-with(., '両') and not(starts-with(., '両親')) and not(starts-with(., '両耳'))">
                    <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                  </xsl:when>
                  <xsl:when test="starts-with(., '各')">
                    <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                  </xsl:when>
                  <xsl:when test="starts-with(., '毎')">
                    <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <!-- noun for CSJ -->
              <xsl:when test="@pos = '名詞'">
                <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
              </xsl:when>

              <xsl:when test="@pos = '名詞-普通名詞-サ変可能' and ../following-sibling::LUW[1]/@l_lForm = '。'">
                <xsl:value-of select="."/><xsl:text>	VB;</xsl:text><xsl:value-of select="@l_lemma"/><xsl:text>
</xsl:text>
              </xsl:when>

              <xsl:when test="@pos = '名詞-普通名詞-サ変可能' and @lemma='-'">
                <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
              </xsl:when>

              <xsl:when test="@pos = '名詞-普通名詞-サ変可能'">
                <xsl:value-of select="."/><xsl:text>	NV
</xsl:text>
              </xsl:when>

              <xsl:when test="@pos = '名詞-普通名詞-形状詞可能'">
                <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '名詞-普通名詞-サ変形状詞可能'">
                <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '名詞-普通名詞-副詞可能'">
                <xsl:choose>
                  <xsl:when test="@l_lemma = '自身'">
                    <xsl:value-of select="."/><xsl:text>	PRO
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@l_lemma = '半分'">
                    <xsl:value-of select="."/><xsl:text>	Q
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '多く'">
                    <xsl:value-of select="."/><xsl:text>	Q
</xsl:text>
                  </xsl:when>
                  <xsl:when test="starts-with(., '全')">
                    <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                  </xsl:when>
                  <xsl:when test="starts-with(., '両') and not(starts-with(., '両親')) and not(starts-with(., '両耳'))">
                    <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                  </xsl:when>
                  <xsl:when test="starts-with(., '各')">
                    <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                  </xsl:when>
                  <xsl:when test="starts-with(., '毎')">
                    <xsl:value-of select="."/><xsl:text>	Q+N
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <!-- counters -->
              <xsl:when test="@pos = '名詞-普通名詞-助数詞可能'">
                <xsl:value-of select="."/><xsl:text>	NUMCL
</xsl:text>
              </xsl:when>

              <!-- proper nouns -->
              <xsl:when test="@pos = '名詞-固有名詞-一般'">
                <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '名詞-固有名詞-人名-一般'">
                <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '名詞-固有名詞-人名-姓'">
                <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '名詞-固有名詞-人名-名'">
                <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '名詞-固有名詞-地名-一般'">
                <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '名詞-固有名詞-地名-国'">
                <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
              </xsl:when>
              <!-- proper name for CSJ -->
              <xsl:when test="@l_pos = '名詞-固有名詞'">
                <xsl:value-of select="."/><xsl:text>	NPR
</xsl:text>
              </xsl:when>

              <!-- numbers -->
              <xsl:when test="@pos = '名詞-数詞' and starts-with(@lemma, '何')">
                <xsl:value-of select="."/><xsl:text>	WCARD
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '名詞-数詞' and @lemma='幾'">
                <xsl:value-of select="."/><xsl:text>	WCARD
</xsl:text>
              </xsl:when>

              <xsl:when test="@pos = '名詞-数詞'">
                <xsl:value-of select="."/><xsl:text>	CARD
</xsl:text>
              </xsl:when>

              <!-- adverb? -->
              <xsl:when test="@pos = '名詞-助動詞語幹'">
                <xsl:value-of select="."/><xsl:text>	ADV
</xsl:text>
              </xsl:when>

              <!-- pronoun -->
              <xsl:when test="@pos = '代名詞'">
                <xsl:choose>
                  <xsl:when test="@lemma = '何れ'">
                    <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '何時'">
                    <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '誰'">
                    <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '何処'">
                    <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '何方'">
                    <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '何'">
                    <xsl:value-of select="."/><xsl:text>	WPRO
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	PRO
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <!-- adjective -->
              <xsl:when test="@pos = '形状詞-一般'">
                <xsl:value-of select="."/><xsl:text>	ADJN
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '形状詞-タリ'">
                <xsl:value-of select="."/><xsl:text>	ADJT
</xsl:text>
              </xsl:when>

              <!-- adjective for CSJ -->
              <xsl:when test="@pos = '形状詞'">
                <xsl:choose>
                  <xsl:when test="@lemma = '様'">
                    <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	ADJN
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <!-- よう and そう -->
              <xsl:when test="@pos = '形状詞-助動詞語幹'">
                <xsl:choose>
                  <xsl:when test="@lemma = 'そう'">
                    <xsl:value-of select="."/><xsl:text>	ADV
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <!-- determiner -->
              <xsl:when test="@pos = '連体詞'">
                <xsl:choose>
                  <xsl:when test="@lemma = '如何なる'">
                    <xsl:value-of select="."/><xsl:text>	WD
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '何の'">
                    <xsl:value-of select="."/><xsl:text>	WD
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = 'どんな'">
                    <xsl:value-of select="."/><xsl:text>	WD
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '我が'">
                    <xsl:value-of select="."/><xsl:text>	PRO
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	D
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <!-- adverb -->
              <xsl:when test="@pos = '副詞'">
                <xsl:choose>
                  <xsl:when test="@lemma = 'どう' or @lemma = 'どうして' or @lemma = 'なぜ' or @lemma = 'いかが' or @lemma = '如何に' or @lemma = 'どんなに' or @lemma = '何で' or @lemma = 'どのように' or @lemma = 'なんで' or @lemma = '如何' or @lemma = '何故' or @lemma = 'どー' or @lemma = 'どんな'">
                    <xsl:value-of select="."/><xsl:text>	WADV
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	ADV
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <!-- conjunction -->
              <xsl:when test="@pos = '接続詞'">
                <xsl:value-of select="."/><xsl:text>	CONJ
</xsl:text>
              </xsl:when>

              <!-- interjection -->
              <xsl:when test="@pos = '感動詞-一般'">
                <xsl:value-of select="."/><xsl:text>	INTJ
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '感動詞-フィラー' and ../@l_pos = '名詞-普通名詞-一般'">
                <xsl:value-of select="."/><xsl:text>	D
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '感動詞-フィラー'">
                <xsl:value-of select="."/><xsl:text>	INTJ
</xsl:text>
              </xsl:when>
              <!-- interjection for CSJ -->
              <xsl:when test="@pos = '言いよどみ'">
                <xsl:value-of select="."/><xsl:text>	INTJ
</xsl:text>
              </xsl:when>

              <!-- verb, volitional -->
              <xsl:when test="@pos = '動詞-一般' and @cForm = '意志推量形'">
                <xsl:value-of select="."/><xsl:text>	VB-VOL;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
              </xsl:when>

              <!-- verb, general -->
              <xsl:when test="@pos = '動詞-一般'">
                <xsl:value-of select="."/><xsl:text>	VB;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
              </xsl:when>

              <!-- verb for CSJ -->
              <xsl:when test="@pos = '動詞'">
                <xsl:choose>
                  <xsl:when test="../@l_pos = '助動詞'">
                    <xsl:value-of select="."/><xsl:text>	VB2;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	VB;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <!-- secondary verb -->
              <xsl:when test="@pos = '動詞-非自立可能'">
                <xsl:value-of select="."/><xsl:text>	VB2;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
              </xsl:when>

              <!-- adjective -->
              <xsl:when test="@pos = '形容詞-一般'">
                <xsl:value-of select="."/><xsl:text>	ADJI
</xsl:text>
              </xsl:when>
              <!-- adjective for CSJ -->
              <xsl:when test="@pos = '形容詞'">
                <xsl:value-of select="."/><xsl:text>	ADJI
</xsl:text>
              </xsl:when>

              <xsl:when test="@pos = '形容詞-非自立可能'">
                <xsl:choose>
                  <xsl:when test="@lemma = 'らしい'">
                    <xsl:value-of select="."/><xsl:text>	MD
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '無い'">
                    <xsl:value-of select="."/><xsl:text>	NEG
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	ADJI
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <!-- auxiliary verb -->
              <xsl:when test="@pos = '助動詞'">
                <xsl:choose>
                  <xsl:when test=". = 'たら' or . = 'だら'">
                    <xsl:value-of select="."/><xsl:text>	P
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = 'ず'">
                    <xsl:value-of select="."/><xsl:text>	NEG
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = 'ない'">
                    <xsl:value-of select="."/><xsl:text>	NEG
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = 'られる'">
                    <xsl:value-of select="."/><xsl:text>	VB2;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = 'れる'">
                    <xsl:value-of select="."/><xsl:text>	VB2;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = 'てく' or @lemma = 'とく'">
                    <xsl:value-of select="."/><xsl:text>	VB2;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = 'てる'">
                    <xsl:value-of select="."/><xsl:text>	VB2;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = 'ちゃう'">
                    <xsl:value-of select="."/><xsl:text>	VB2;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = 'た'">
                    <xsl:value-of select="."/><xsl:text>	AXD
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	AX
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>

              <!-- particle, case -->
              <xsl:when test="@pos = '助詞-格助詞'">
                <xsl:value-of select="."/><xsl:text>	P-CASE
</xsl:text>
              </xsl:when>
              <!-- particle, adverbial -->
              <xsl:when test="@pos = '助詞-副助詞'">
                <xsl:value-of select="."/><xsl:text>	P-CASE
</xsl:text>
              </xsl:when>
              <!-- particle, operator -->
              <xsl:when test="@pos = '助詞-係助詞'">
                <xsl:value-of select="."/><xsl:text>	P-OPTR
</xsl:text>
              </xsl:when>
              <!-- particle, conjunctive -->
              <xsl:when test="@pos = '助詞-接続助詞'">
                <xsl:value-of select="."/><xsl:text>	P-CONJ
</xsl:text>
              </xsl:when>
              <!-- particle, sentence-ending -->
              <xsl:when test="@pos = '助詞-終助詞'">
                <xsl:value-of select="."/><xsl:text>	P-FINAL
</xsl:text>
              </xsl:when>
              <!-- particle, の -->
              <xsl:when test="@pos = '助詞-準体助詞' and @lemma = 'の'">
                <xsl:value-of select="."/><xsl:text>	P-NOUN
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '助詞-準体助詞'">
                <xsl:value-of select="."/><xsl:text>	P-FINAL
</xsl:text>
              </xsl:when>

              <!-- prefix -->
              <xsl:when test="@pos = '接頭辞'">
                <xsl:value-of select="."/><xsl:text>	PREFIX
</xsl:text>
              </xsl:when>

              <!-- suffix -->
              <xsl:when test="@pos = '接尾辞-名詞的-一般'">
                <xsl:choose>
                  <xsl:when test="starts-with(preceding-sibling::*[1]/@pos, '接尾辞-名詞的')">
                    <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
                  </xsl:when>
                  <xsl:when test="preceding-sibling::SUW/@pos = '名詞-数詞'">
                    <xsl:value-of select="."/><xsl:text>	NUMCL
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-名詞的-サ変可能'">
                <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-名詞的-形状詞可能'">
                <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-名詞的-サ変形状詞可能'">
                <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-名詞的-副詞可能'">
                <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-名詞的-助数詞'">
                <xsl:choose>
                  <xsl:when test="starts-with(preceding-sibling::*[1]/@pos, '接尾辞-名詞的')">
                    <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
                  </xsl:when>
                  <xsl:when test="preceding-sibling::SUW/@pos = '名詞-数詞'">
                    <xsl:value-of select="."/><xsl:text>	NUMCL
</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-形状詞的'">
                <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-動詞的'">
                <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-形容詞的' and preceding-sibling::SUW/@pos = '動詞-非自立可能'">
                <xsl:value-of select="."/><xsl:text>	AX
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-形容詞的' and preceding-sibling::SUW/@pos = '動詞-一般'">
                <xsl:value-of select="."/><xsl:text>	AX
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '接尾辞-形容詞的'">
                <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
              </xsl:when>
              <!-- suffix for CSJ -->
              <xsl:when test="@pos = '接尾辞'">
                <xsl:value-of select="."/><xsl:text>	SUFFIX
</xsl:text>
              </xsl:when>

              <!-- symbol -->
              <xsl:when test="@pos = '記号-一般' and @lemma='コウ'">
                <xsl:value-of select="."/><xsl:text>	PREFIX
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '記号-一般'">
                <xsl:value-of select="."/><xsl:text>	SYM
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '記号-文字'">
                <xsl:value-of select="."/><xsl:text>	N-LETTER
</xsl:text>
              </xsl:when>
              <!-- symbol for CSJ -->
              <xsl:when test="@pos = '記号'">
                <xsl:value-of select="."/><xsl:text>	SYM
</xsl:text>
              </xsl:when>

              <!-- punctuation, general -->
              <xsl:when test="@pos = '補助記号-一般'">
                <xsl:choose>
                  <xsl:when test="following-sibling::SUW/@pos = '名詞-数詞'">
                    <xsl:value-of select="."/><xsl:text>	CARD
</xsl:text>
                  </xsl:when>
                  <xsl:when test="preceding-sibling::NumTrans">
                    <xsl:value-of select="."/><xsl:text>	CARD
</xsl:text>
                  </xsl:when>

                  <xsl:when test="@lemma = '―'">
                    <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '・'">
                    <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '…'">
                    <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '〜'">
                    <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
                  </xsl:when>
                  <xsl:when test="@lemma = '／'">
                    <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
                  </xsl:when>

                  <xsl:otherwise>
                    <xsl:value-of select="."/><xsl:text>	SYM
</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <!-- punctuation, period -->
              <xsl:when test="@pos = '補助記号-句点'">
                <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
              </xsl:when>
              <!-- punctuation, comma -->
              <xsl:when test="@pos = '補助記号-読点'">
                <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
              </xsl:when>

              <!-- brackets -->
              <xsl:when test="@pos = '補助記号-括弧開'">
                <xsl:value-of select="."/><xsl:text>	-LRB-
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '補助記号-括弧閉'">
                <xsl:value-of select="."/><xsl:text>	-RRB-
</xsl:text>
              </xsl:when>

              <!-- punctuation, AA -->
              <xsl:when test="@pos = '補助記号-AA-一般'">
                <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '補助記号-AA-顔文字'">
                <xsl:value-of select="."/><xsl:text>	PU
</xsl:text>
              </xsl:when>

              <!-- NumTrans -->
              <xsl:when test="../NumTrans">
                <xsl:value-of select="@originalText"/><xsl:text>	CARD
</xsl:text>
              </xsl:when>

              <!-- foreign word -->
              <xsl:when test="@pos = '未知語'">
                <xsl:value-of select="."/><xsl:text>	FW
</xsl:text>
              </xsl:when>
              <xsl:when test="@pos = '英単語'">
                <xsl:value-of select="."/><xsl:text>	FW
</xsl:text>
              </xsl:when>

              <!-- URL -->
              <xsl:when test="@pos = 'URL'">
                <xsl:value-of select="."/><xsl:text>	N
</xsl:text>
              </xsl:when>

              <!-- spaces -->
              <xsl:when test="@pos = '空白'">
              </xsl:when>

              <!-- everything else -->
              <xsl:otherwise>
                <xsl:value-of select="."/><xsl:text>	</xsl:text><xsl:value-of select="@pos"/><xsl:text>
</xsl:text>
              </xsl:otherwise>

            </xsl:choose>
          </xsl:for-each>

        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each><xsl:text>EOS
</xsl:text>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
