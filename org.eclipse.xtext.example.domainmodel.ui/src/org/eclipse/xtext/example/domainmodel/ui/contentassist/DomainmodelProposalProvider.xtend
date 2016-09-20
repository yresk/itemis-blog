/*
 * generated by Xtext
 */
package org.eclipse.xtext.example.domainmodel.ui.contentassist

import org.eclipse.xtext.Group
import org.eclipse.xtext.Keyword
import org.eclipse.xtext.ui.editor.contentassist.ContentAssistContext
import org.eclipse.xtext.ui.editor.contentassist.ICompletionProposalAcceptor
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.RuleCall
import org.eclipse.xtext.example.domainmodel.services.DomainmodelGrammarAccess
import com.google.inject.Inject

/** 
 * See https://www.eclipse.org/Xtext/documentation/304_ide_concepts.html#content-assist
 * on how to customize the content assistant.
 */
class DomainmodelProposalProvider extends AbstractDomainmodelProposalProvider {
	
	@Inject extension DomainmodelGrammarAccess
	
	override complete_DependsOn(EObject model, RuleCall ruleCall, ContentAssistContext context, ICompletionProposalAcceptor acceptor) {
		dependsOnAccess.group.createKeywordProposal(context,acceptor)
	}
	override complete_IsComposedOf(EObject model, RuleCall ruleCall, ContentAssistContext context, ICompletionProposalAcceptor acceptor) {
		isComposedOfAccess.group.createKeywordProposal(context,acceptor)
	}
	
	def createKeywordProposal(Group group, ContentAssistContext context, ICompletionProposalAcceptor acceptor) {
		if (group == null) {
			return null
		}
		val proposalString = group.elements.filter(Keyword).map[value].join(" ") + " "
		acceptor.accept(createCompletionProposal(proposalString, proposalString, null, context))
	}
}
