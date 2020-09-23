/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 *****************************************************************************/
package org.adempiere.apps;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import org.asteriskjava.manager.event.DialEvent;
import org.asteriskjava.manager.action.HangupAction;
import org.compiere.apps.AEnv;
import org.compiere.apps.AWindow;
import org.compiere.apps.ConfirmPanel;
import org.compiere.model.MQuery;
import org.compiere.model.MUser;
import org.compiere.swing.CDialog;
import javax.swing.*;
import javax.swing.border.*;

/**
 * Notify Box
 * 
 * @author jmpiloq, evenos GmbH
 * @version $Id: $
 * 
 */
public class NotifyBox extends CDialog
{
	// NBox Width
	private int nboxWidth = 300;

	// NBox height
	private int nboxHeight = 80;

	// Step
	private int step = 20;

	// Step time
	private int stepTime = 20;

	// Show time
	private int displayTime = 10000;
	
	// Current number
	private int noNBox = 0;
	
	// Last opened NBox
	private int maxNBox = 0;

	// Max number of NBoxes on screen
	private int maxNBoxScreen;
	
	// Font used
	private Font font;
	
	// Border color
	private Color borderColor;
	
	// 	NBox Color
	private Color nboxColor;
	
	// Set message color
	private Color messageColor;
	
	// Set the margin
	int margin;
	
	boolean useAlwaysOnTop = true;
	
	private static final long serialVersionUID = 1L;
	
	private MUser m_user = null;
	
	/**
	 * Constructor to initialized NBox component
	 * 
	 * @author jmpiloq, evenos GmbH
	 * 
	 */
	public NotifyBox()
	{
		// Set default font...
		font = new Font("Arial", Font.BOLD, 12);
		// Border color
		borderColor = new Color(245, 153, 15);
		nboxColor = Color.WHITE;
		messageColor = Color.BLACK;
		useAlwaysOnTop = true;
		// Verify AlwaysOnTop Flag...
		try
		{
		  JWindow.class.getMethod( "setAlwaysOnTop", new Class[] { Boolean.class } );
		}
		catch( Exception e )
		{
			useAlwaysOnTop = false;
		}
		
	}
	
	class SingleNBox extends JWindow implements ActionListener
	{
		private static final long serialVersionUID = 1L;

		// Label to store Icon
		private JLabel iconLabel = new JLabel();

		// Text area for the message
		private JTextArea message = new JTextArea();
		
		private ConfirmPanel	confirmPanel = new ConfirmPanel(true);



		public SingleNBox()
		{
			initComponents();
		}

		public SingleNBox(MUser caller){
			initComponents();
			m_user = caller;
		}
		
		private void initComponents()
		{
			
			setSize(nboxWidth, nboxHeight);
			message.setFont( getNboxMessageFont() );
			JPanel externalPanel = new JPanel(new BorderLayout(1, 1));
			externalPanel.setBackground( getBorderColor() );
			JPanel innerPanel = new JPanel(new BorderLayout( getMargin(), getMargin() ));
			innerPanel.setBackground( getNboxColor() );
			message.setBackground( getNboxColor() );
			message.setMargin( new Insets( 10,10,2,2 ) );
			message.setLineWrap( true );
			message.setWrapStyleWord( true );
			
			EtchedBorder etchedBorder = (EtchedBorder) BorderFactory
					.createEtchedBorder();
			externalPanel.setBorder(etchedBorder);

			externalPanel.add(innerPanel);
			message.setForeground( getMessageColor() );
			innerPanel.add(iconLabel, BorderLayout.WEST);
			innerPanel.add(message, BorderLayout.CENTER);
			innerPanel.add(confirmPanel, BorderLayout.SOUTH);
			confirmPanel.addActionListener(this);

			getContentPane().add(externalPanel);
		}
    
		public void animate()
		{
			( new Animation( this ) ).start();
		}

		/**
		 * 	Action Performed
		 *	@param e event
		 */
		public void actionPerformed(ActionEvent e) {
			if (e.getActionCommand().equals(ConfirmPanel.A_OK)) {
				final int USER_WINDOW_ID = 108;
				String whereString = "name = '" + m_user.getName() + "'";
				final AWindow poFrame = new AWindow();
				final MQuery query = new MQuery("AD_User");
				query.addRestriction(whereString);
				final boolean ok = poFrame.initWindow(USER_WINDOW_ID, query);
				poFrame.pack();
				AEnv.showCenterScreen(poFrame);
//				System.out.println("blip");
			}
			if (e.getActionCommand().equals(ConfirmPanel.A_CANCEL)){
				System.out.println("blip");
			}
			dispose();
		} //	actionPerformed
		
	}

	class Animation extends Thread
	{
		SingleNBox nbox;
		
		public Animation( SingleNBox nbox )
		{
			this.nbox = nbox;
		}
		
		
		/**
		 * Vertical animation
		 * @param posx
		 * @param fromy
		 * @param toy
		 * @throws InterruptedException 
		 */
		protected void animateVertically( int posx, int fromY, int toY ) throws InterruptedException
		{
			
			nbox.setLocation( posx, fromY );
			if ( toY < fromY )
			{
				for (int i = fromY; i > toY; i -= step)
				{
					nbox.setLocation(posx, i);
					Thread.sleep(stepTime);
				}
			}
			else
			{
				for (int i = fromY; i < toY; i += step)
				{
					nbox.setLocation(posx, i);
					Thread.sleep(stepTime);
				}
			}
			nbox.setLocation( posx, toY );
		}
		
		public void run()
		{
			try
			{
				boolean animateFromBottom = true;
				GraphicsEnvironment ge = GraphicsEnvironment
						.getLocalGraphicsEnvironment();
				Rectangle screenRect = ge.getMaximumWindowBounds();

				int screenHeight = (int) screenRect.height;
			
				int startYPosition;
				int stopYPosition;
				
				if ( screenRect.y > 0 )
				{
				  animateFromBottom = false; // Animate from top!
				}

				maxNBoxScreen = screenHeight / nboxHeight;
				
				
				int posx = (int) screenRect.width - nboxWidth - 1;

				nbox.setLocation(posx, screenHeight);
				nbox.setVisible(true);
				if ( useAlwaysOnTop )
				{
				  nbox.setAlwaysOnTop(true);
				}
				
				if ( animateFromBottom )
				{
					startYPosition = screenHeight;
					stopYPosition = startYPosition - nboxHeight - 1;
					if ( noNBox > 0 )
					{
						stopYPosition = stopYPosition - ( maxNBox % maxNBoxScreen * nboxHeight );
					}
					else
					{
						maxNBox = 0;
					}
				}
				else
				{
					startYPosition = screenRect.y - nboxHeight;
					stopYPosition = screenRect.y;
					
					if ( noNBox > 0 )
					{
						stopYPosition = stopYPosition + ( maxNBox % maxNBoxScreen * nboxHeight );
					}
					else
					{
						maxNBox = 0;
					}
				}
				
				noNBox++;
				maxNBox++;
				
				
				animateVertically( posx, startYPosition, stopYPosition );
				Thread.sleep(displayTime);
				animateVertically( posx, stopYPosition, startYPosition );
				
				noNBox--;
				nbox.setVisible(false);
				nbox.dispose();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
	}
	
	
	public void show(Icon icon, MUser caller, DialEvent de) {
		SingleNBox s_nbox = new SingleNBox(caller);
		if (icon != null) {
			s_nbox.iconLabel.setIcon(icon);
		}
		String msg = "Anruf von: " + caller.getName() + "\n" + de.getCallerId();
		s_nbox.message.setText(msg);
		s_nbox.animate();
	}

	public void show(Icon icon, String msg) {
		SingleNBox s_nbox = new SingleNBox();
		if (icon != null) {
			s_nbox.iconLabel.setIcon(icon);
		}
		s_nbox.message.setText(msg);
		s_nbox.animate();
	}

	public void show( String msg )
	{
		show( null, msg );
	}

	/**
	 * @return Returns the font
	 */
	public Font getNboxMessageFont()
	{
		return font;
	}

	/**
	 * Set the font for the message
	 */
	public void setNboxMessageFont( Font f)
	{
    font = f;
	}

		
	/**
	 * @return Returns the borderColor.
	 */
	public Color getBorderColor()
	{
		return borderColor;
	}



	/**
	 * @param borderColor The borderColor to set.
	 */
	public void setBorderColor(Color borderColor)
	{
		this.borderColor = borderColor;
	}



	/**
	 * @return Returns the displayTime.
	 */
	public int getDisplayTime()
	{
		return displayTime;
	}



	/**
	 * @param displayTime The displayTime to set.
	 */
	public void setDisplayTime(int displayTime)
	{
		this.displayTime = displayTime;
	}



	/**
	 * @return Returns the margin.
	 */
	public int getMargin()
	{
		return margin;
	}



	/**
	 * @param margin The margin to set.
	 */
	public void setMargin(int margin)
	{
		this.margin = margin;
	}



	/**
	 * @return Returns the messageColor.
	 */
	public Color getMessageColor()
	{
		return messageColor;
	}



	/**
	 * @param messageColor The messageColor to set.
	 */
	public void setMessageColor(Color messageColor)
	{
		this.messageColor = messageColor;
	}



	/**
	 * @return Returns the step.
	 */
	public int getStep()
	{
		return step;
	}



	/**
	 * @param step The step to set.
	 */
	public void setStep(int step)
	{
		this.step = step;
	}



	/**
	 * @return Returns the stepTime.
	 */
	public int getStepTime()
	{
		return stepTime;
	}



	/**
	 * @param stepTime The stepTime to set.
	 */
	public void setStepTime(int stepTime)
	{
		this.stepTime = stepTime;
	}



	/**
	 * @return Returns the nboxColor.
	 */
	public Color getNboxColor()
	{
		return nboxColor;
	}



	/**
	 * @param nboxColor The nboxColor to set.
	 */
	public void setNboxColor(Color nboxColor)
	{
		this.nboxColor = nboxColor;
	}



	/**
	 * @return Returns the nboxHeight.
	 */
	public int getNboxHeight()
	{
		return nboxHeight;
	}



	/**
	 * @param nboxHeight The nboxHeight to set.
	 */
	public void setNboxHeight(int nboxHeight)
	{
		this.nboxHeight = nboxHeight;
	}



	/**
	 * @return Returns the nboxWidth.
	 */
	public int getNboxWidth()
	{
		return nboxWidth;
	}



	/**
	 * @param nboxWidth The nboxWidth to set.
	 */
	public void setNboxWidth(int nboxWidth)
	{
		this.nboxWidth = nboxWidth;
	}


}
