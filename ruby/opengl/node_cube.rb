require 'opengl'

class Cube
  def initialize
    @angle = 30.0
  end

  def update
    @angle += 2.0
    if (@angle > 360)
        @angle -= 360
    end
  end

  def draw
	glTranslatef(0.0, 0.0, -8.0)
	
	# Add ambient light
	ambientColor = [0.2, 0.2, 0.2, 1.0] #Color (0.2, 0.2, 0.2)
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambientColor)
	
	# Add positioned light
	lightColor0 = [0.5, 0.5, 0.5, 1.0] #Color (0.5, 0.5, 0.5)
	lightPos0 = [4.0, 0.0, 8.0, 1.0] # positioned at (4, 0, 8)
	glLightfv(GL_LIGHT0, GL_DIFFUSE, lightColor0)
	glLightfv(GL_LIGHT0, GL_POSITION, lightPos0)
	
	# Add directed light
	lightColor1 = [0.5, 0.2, 0.2, 1.0] # Color (0.5, 0.2, 0.2)
	# Coming from the direction (-1, 0.5, 0.5)
	lightPos1 = [-1.0, 0.5, 0.5, 0.0]
	glLightfv(GL_LIGHT1, GL_DIFFUSE, lightColor1)
	glLightfv(GL_LIGHT1, GL_POSITION, lightPos1)
	
	glRotatef(@angle, 1.0, 0.5, 0.0)
	glColor3f(1.0, 1.0, 0.0)
	glBegin(GL_QUADS)
	
	#Front
	#glNormal3f(0.0, 0.0, 1.0)
	glNormal3f(-1.0, 0.0, 1.0)
	glVertex3f(-1.5, -1.0, 1.5)
	glNormal3f(1.0, 0.0, 1.0)
	glVertex3f(1.5, -1.0, 1.5)
	glNormal3f(1.0, 0.0, 1.0)
	glVertex3f(1.5, 1.0, 1.5)
	glNormal3f(-1.0, 0.0, 1.0)
	glVertex3f(-1.5, 1.0, 1.5)
	
	#Right
	#glNormal3f(1.0, 0.0, 0.0)
	glColor3f(1.0, 0.0, 0.0)
	glNormal3f(1.0, 0.0, -1.0)
	glVertex3f(1.5, -1.0, -1.5)
	glNormal3f(1.0, 0.0, -1.0)
	glVertex3f(1.5, 1.0, -1.5)
	glNormal3f(1.0, 0.0, 1.0)
	glVertex3f(1.5, 1.0, 1.5)
	glNormal3f(1.0, 0.0, 1.0)
	glVertex3f(1.5, -1.0, 1.5)
	
	#Back
	#glNormal3f(0.0, 0.0, -1.0)
	glColor3f(0.0, 1.0, 0.0)
	glNormal3f(-1.0, 0.0, -1.0)
	glVertex3f(-1.5, -1.0, -1.5)
	glNormal3f(-1.0, 0.0, -1.0)
	glVertex3f(-1.5, 1.0, -1.5)
	glNormal3f(1.0, 0.0, -1.0)
	glVertex3f(1.5, 1.0, -1.5)
	glNormal3f(1.0, 0.0, -1.0)
	glVertex3f(1.5, -1.0, -1.5)
	
	#Left
	#glNormal3f(-1.0, 0.0, 0.0)
	glColor3f(0.0, 1.0, 1.0)
	glNormal3f(-1.0, 0.0, -1.0)
	glVertex3f(-1.5, -1.0, -1.5)
	glNormal3f(-1.0, 0.0, 1.0)
	glVertex3f(-1.5, -1.0, 1.5)
	glNormal3f(-1.0, 0.0, 1.0)
	glVertex3f(-1.5, 1.0, 1.5)
	glNormal3f(-1.0, 0.0, -1.0)
	glVertex3f(-1.5, 1.0, -1.5)
	
	glColor3f(0.0, 0.0, 1.0)
	glVertex3f(-3.5, -1.0, -1.5)
	glNormal3f(-5.0, 0.0, 1.0)
	glVertex3f(-5.5, -1.0, 1.5)
	glNormal3f(-2.0, 0.0, 1.0)
	glVertex3f(-1.5, 1.0, 1.5)
	glNormal3f(-1.0, 0.0, -1.0)
	glVertex3f(-1.5, 1.0, -1.5)
	
	glEnd()
  end
end
