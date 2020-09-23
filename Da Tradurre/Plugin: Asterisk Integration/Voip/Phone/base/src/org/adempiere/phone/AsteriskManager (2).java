/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2010 Adempiere, Inc. All Rights Reserved.               *
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
package org.adempiere.phone;

import java.io.IOException;

import org.asteriskjava.manager.AuthenticationFailedException;
import org.asteriskjava.manager.ManagerConnection;
import org.asteriskjava.manager.ManagerConnectionFactory;
import org.asteriskjava.manager.TimeoutException;
import org.asteriskjava.manager.action.OriginateAction;
import org.asteriskjava.manager.response.ManagerResponse;

/**
 * Class for interaction with the Asterisk Manager interface.
 * 
 * @author needle58
 * 
 */
public class AsteriskManager {

	/** Manager for Connection with Asterisk          */
	private ManagerConnection managerConnection;

    /*
     * Obtain a managerConnection
     * 
     *  @param String server
     *  @param String user
     *  @param String pw
     */
    public AsteriskManager(String server, String user, String pw) throws IOException
    {
        ManagerConnectionFactory factory = new ManagerConnectionFactory(
                server, user, pw); // e.g. "192.168.1.11", "manager", "mysecret");

        this.managerConnection = factory.createManagerConnection();
    }

    /*
     * Initiate the call at the server
     * 
     * @param String astChannel
     * @param String astContext
     * @param String astExten
     * @param Integer astPrority
     * @param Long astTimeout
     * @return Server reply like "Success" or "Error"
     */
    public String initiateCall(String astChannel, String astContext, String astExten, Integer astPrority, Long astTimeout) throws IOException, AuthenticationFailedException,
            TimeoutException
    {
        OriginateAction originateAction;
        ManagerResponse originateResponse;

        originateAction = new OriginateAction();
        originateAction.setChannel(astChannel);
        originateAction.setContext(astContext);
        originateAction.setExten(astExten);
        originateAction.setPriority(astPrority);
        originateAction.setTimeout(astTimeout);

        // connect to Asterisk and log in
        managerConnection.login();

        // send the originate action and wait for a maximum of 30 seconds for Asterisk
        // to send a reply
        originateResponse = managerConnection.sendAction(originateAction, 30000);

        // print out whether the originate succeeded or not
        String result = originateResponse.getResponse();

        // and finally log off and disconnect
        managerConnection.logoff();
        
        return(result);
    }
    
}
