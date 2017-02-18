
# Appearance
width        = '367px'
barHeight    = '36px'
labelColor   = '#fff'
usedColor    = '#d7051d'
freeColor    = '#525252'
bgColor      = '#fff'
borderRadius = '3px'
bgOpacity    = 0.9

command: "python ./xkcd-random.widget/script.py"

# Set the refresh frequency (milliseconds) to every 10 min
refreshFrequency: "1day"

style: """

  // Align contents left or right
  widget-align = left
  
  // Position where you want
  top: 120px
  right: 10px
  
  // Statics text settings
  color: #fff
  font-family Helvetica Neue
  background rgba(#000, .5)
  padding 10px 10px 15px
  border-radius 5px
  
  // Style
  .container
    width: 200px
    text-align: widget-align
    position: relative
    clear: both

  .container:not(:first-child)
    margin-top: 20px

  .widget-title
    text-align: widget-align

  .stats-container
    margin-bottom 5px
    border-collapse collapse

  td
    font-size: 24px
    font-weight: 300
    color: rgba(#fff, .9)
    text-shadow: 0 1px 0px rgba(#000, .7)
    text-align: widget-align

  td.pctg
    float: right
	
  img
    width: 430px

  p
    font-size 21px
    width: 300px

  .widget-title
    font-size 20px
    text-transform uppercase
    font-weight bold

  .label
    font-size 18px
    text-transform uppercase
    font-weight bold


"""

# Render the output.
render: (output) -> """
  <div id='container'>
  <div>
"""

update: (output, domEl) -> 
  xkcd = JSON.parse(output)
  container = $(domEl).find('#container')
  content = 
    """
	<div class="widget-title">#{xkcd.title}</div>
	<p>#{xkcd.alt}</p>
    <img src="#{xkcd.img}"/>
    """
  $(container).html content
