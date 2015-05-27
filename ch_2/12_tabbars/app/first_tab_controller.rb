class FirstTabController < UIViewController
  def init
    if super 
      self.title = "First Tab"
      self.tabBarItem.image = UIImage.imageNamed('FirstTab.png')
    end
    self
  end 

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor
    @label = UILabel.new
    @label.text = 'First Tab'
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
   
    if(sender.direction == UISwipeGestureRecognizerDirectionRight)
      p "Swiped right"
      $tabbar.selectedIndex =1
    end
  end
end
