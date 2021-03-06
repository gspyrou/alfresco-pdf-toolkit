<%--
 * Copyright 2008-2012 Alfresco Software Limited.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 * 
 * This file is part of an unsupported extension to Alfresco.
--%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/alfresco.tld" prefix="a"%>
<%@ taglib uri="/WEB-INF/repo.tld" prefix="r"%>

<%@ page buffer="32kb" contentType="text/html;charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="org.alfresco.web.ui.common.PanelGenerator"%>

<r:page titleId="title_action_pdf_append">

	<f:view>

		<%-- load a bundle of properties with I18N strings --%>
		<f:loadBundle basename="alfresco.messages.webclient" var="msg" />
		<f:loadBundle basename="alfresco.messages.pdf-toolkit" var="customMsg" />

		<h:form acceptcharset="UTF-8" id="pdf-append-action">

			<%-- Main outer table --%>
			<table cellspacing="0" cellpadding="2">

				<%-- Title bar --%>
				<tr>
					<td colspan="2"><%@ include file="../parts/titlebar.jsp"%>
					</td>
				</tr>

				<%-- Main area --%>
				<tr valign="top">
					<%-- Shelf --%>
					<td><%@ include file="../parts/shelf.jsp"%>
					</td>

					<%-- Work Area --%>
					<td width="100%">
						<table cellspacing="0" cellpadding="0" width="100%">
							<%-- Breadcrumb --%>
							<%@ include file="../parts/breadcrumb.jsp"%>

							<%-- Status and Actions --%>
							<tr>
								<td
									style="background-image: url(<%=request.getContextPath()%>/ images/ parts/ statuspanel_4 . gif )"
									width="4"></td>
								<td bgcolor="#dfe6ed">
									<%-- Status and Actions inner contents table --%> <%-- Generally this consists of an icon, textual summary and actions for the current object --%>
									<table cellspacing="4" cellpadding="0" width="100%">
										<tr>
											<td width="32"><h:graphicImage id="wizard-logo"
													url="/images/icons/new_rule_large.gif" /></td>
											<td>
												<div class="mainTitle">
													<h:outputText value="#{WizardManager.title}" />
												</div>
												<div class="mainSubText">
													<h:outputText value="#{WizardManager.description}" />
												</div>
											</td>
										</tr>
									</table>

								</td>
								<td
									style="background-image: url(<%=request.getContextPath()%>/ images/ parts/ statuspanel_6 . gif )"
									width="4"></td>
							</tr>

							<%-- separator row with gradient shadow --%>
							<tr>
								<td><img
									src="<%=request.getContextPath()%>/images/parts/statuspanel_7.gif"
									width="4" height="9"></td>
								<td
									style="background-image: url(<%=request.getContextPath()%>/ images/ parts/ statuspanel_8 . gif )"></td>
								<td><img
									src="<%=request.getContextPath()%>/images/parts/statuspanel_9.gif"
									width="4" height="9"></td>
							</tr>

							<%-- Details --%>
							<tr valign=top>
								<td
									style="background-image: url(<%=request.getContextPath()%>/ images/ parts/ whitepanel_4 . gif )"
									width="4"></td>
								<td>
									<table cellspacing="0" cellpadding="3" border="0" width="100%">
										<tr>
											<td width="100%" valign="top"><a:errors
													message="#{msg.error_wizard}" styleClass="errorMessage" />
												<%
												    PanelGenerator.generatePanelStart(out, request.getContextPath(), "white", "white");
												%>
												<table cellpadding="2" cellspacing="2" border="0"
													width="100%">
													<tr>
														<td colspan="2" class="mainSubTitle"><h:outputText
																value="#{msg.set_action_values}" /></td>
													</tr>
													<tr>
														<td class="paddingRow"></td>
													</tr>
													<tr>
														<td><h:outputText
																value="#{customMsg.pdfappend_name}:" /></td>
														<td><h:inputText
																value="#{WizardManager.bean.actionProperties.PDFAppendName}"
																size="50" maxlength="1024" /></td>
													</tr>
													<tr>
														<td colspan="2" class="paddingRow"></td>
													</tr>
													<tr>
														<td><h:outputText value="#{msg.destination}" />:</td>
														<td><r:ajaxFolderSelector id="spaceSelector"
																label="#{msg.select_destination_prompt}"
																value="#{WizardManager.bean.actionProperties.destinationLocation}"
																initialSelection="#{NavigationBean.currentNode.nodeRefAsString}"
																styleClass="selector" /></td>
													</tr>
													<tr>
														<td class="paddingRow"></td>
													</tr>
													<tr>
														<td><h:outputText value="#{customMsg.pdfappend_to}:" /></td>
														<td><r:contentSelector id="content-picker"
																value="#{WizardManager.bean.actionProperties.PDFAppendTarget}" /></td>
													</tr>
													<tr>
														<td class="paddingRow"></td>
													</tr>
												</table> <%
     PanelGenerator.generatePanelEnd(out, request.getContextPath(), "white");
 %></td>

											<td valign="top">
												<%
												    PanelGenerator.generatePanelStart(out, request.getContextPath(), "greyround", "#F5F5F5");
												%>
												<table cellpadding="1" cellspacing="1" border="0">
													<tr>
														<td align="center"><h:commandButton value="#{msg.ok}"
																action="#{WizardManager.bean.addAction}"
																styleClass="wizardButton"
																disabled="#{WizardManager.bean.actionProperties.destinationLocation == null}" />
														</td>
													</tr>
													<tr>
														<td align="center"><h:commandButton
																value="#{msg.cancel_button}"
																action="#{WizardManager.bean.cancelAddAction}"
																styleClass="wizardButton" /></td>
													</tr>
												</table> <%
     PanelGenerator.generatePanelEnd(out, request.getContextPath(), "greyround");
 %>
											</td>
										</tr>
									</table>
								</td>
								<td
									style="background-image: url(<%=request.getContextPath()%>/ images/ parts/ whitepanel_6 . gif )"
									width="4"></td>
							</tr>

							<%-- separator row with bottom panel graphics --%>
							<tr>
								<td><img
									src="<%=request.getContextPath()%>/images/parts/whitepanel_7.gif"
									width="4" height="4"></td>
								<td width="100%" align="center"
									style="background-image: url(<%=request.getContextPath()%>/ images/ parts/ whitepanel_8 . gif )"></td>
								<td><img
									src="<%=request.getContextPath()%>/images/parts/whitepanel_9.gif"
									width="4" height="4"></td>
							</tr>

						</table>
					</td>
				</tr>
			</table>

		</h:form>

	</f:view>

</r:page>
