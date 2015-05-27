class SecondTabController < UIViewController
  def init
    if super
      self.title = "Second Tab Controller"
      self.tabBarItem.image = UIImage.imageNamed('SecondTab.png')
    end
    self
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text = 'Second Tab Controller'
    @label.frame = [[50,50],[250,50]]
    view.addSubview(@label)

    # right
    recognizer = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:'handle_swipe:')
    self.view.addGestureRecognizer(recognizer)
    # left
    recognizer = UISwipeGestureRecognizer.alloc.initWithTarget(self, action:'handle_swipe:')
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft
    self.view.addGestureRecognizer(recognizer)        


  end


  def handle_swipe(sender)
   
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
      p "Swiped left"
      $tabbar.selectedIndex = 0
    end
  end  
end
