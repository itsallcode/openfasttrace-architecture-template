<!--
  #%L
  OpenFastTrace
  %%
  Copyright (C) 2018 itsallcode.org
  %%
  This document is based on https://arc42.org by Dr. G. Starke & Dr. P. Hruschka
  with modifications and additions from itsallcode.org, licensed under CC-BY-SA 4.0
  #L%
  -->
# Risks

> OFT: No one likes this chapter &mdash; and that is a clear sign that it is very important. Writing your risks down forces you to think about the choices you have.

> OFT: Is there a chance to change the architecture to completely avoid the risk?

> OFT: If not, what options do you have to mitigate the risks?

> OFT: What will it cost you if a risk becomes reality? What does it cost you to prevent it?

This chapter lists the technical and organizational risks that either influence architectural decisions or are caused by them.

Risks are often the direct consequence of constraints, so please check the chapter ["Constraints"](constraints.md) for background information.

> OFT: A question that we often were confronted with is whether it is a good idea to keep risk in the architecture document. After all most projects have a central risk list that also contains progress and status information. Collecting risks here means duplication to a certain extend.

> OFT: On the other hand there are risks that you as an architect cannot ignore and it is good to keep them as close to your architecture as possible. After all they share the same life cycle.

> OFT: What worked best for us so far is detailing the risks where the arise, i.e. in the [System Requirement Specification (SRS)](bibliography.md#srs), in the architecture and the detailed designs. We then only referenced them in the project's global risk list so that we could do the task planning and progress tracking outside of the specification documents.

> OFT: If there are risks that cannot be mitigated, we strongly recommend you bring them to the attention of project management. Project management must then decide on whether to approve additional efforts and costs to remove the risk or to accept the risk and the associated responsibility. Your job as a professional architect is to outline the options project management together with the consequences.

## Security Risks

### Unpatched HTTP Client Vulnerabilities
`archrisk~ayb.unpatched-http-client-vulnerabilities`

The guaranteed time-to-fix for known vulnerabilities in the Wriggly Wombat Soft HTTP client we are using in the [MachineApplication](components/MachineApplication.md) is two weeks counted from the day a vulnerability is first reported. Worst case this means that our product suffers from an unpatched vulnerability for the whole two weeks.

> OFT: This admittedly constructed example demonstrates why project members in general and project management in particular tend to avoid thinking too much about risks. This risk is a potential show-stopper for the whole product. As a professional architect you have to make the risk transparent. Project management needs to calculate and decide whether it is in total cheaper to accept the risk with all consequences or to spend time, effort and money to mitigate or remove it.

> OFT: The example risk was picked to show that there are risks that cannot be fully removed. No matter what you do, the time-to-fix will never be zero, especially when an external supplier is involved.  

Consequences:

* Depending on the severity of the vulnerability consequences range from remote Denial-of-Service (DoS) over data leakage to remote infection of the AutoYummyBox with malicious code.
* Since the HTTP client is also an integral part of the [CreditCardReader](components/CreditCardReader.md) the worst thing that could happen is leakage of our customers' credit card information. 

The following mitigations are possible:

1. Raise the awareness of critical vulnerabilities at our supplier (case-by-case)

   We will do this but there is no guarantee this will speed up the fix.

1. Offer a patch (case-by-case)

   We have the source code but we are neither allowed nor able to exchange the HTTP client in the [CreditCardReader](components/CreditCardReader.md).
   Also it is questionable whether we are faster to create a patch than the original maker of the HTTP client.

1. Compartmentalize the vulnerability in our components (case-by-case)

   We will do this as a last resort for critical vulnerabilities if we come to the conclusion that the security risk can be mitigated with reasonable effort.
   Also keep in mind that workarounds often create new attack surfaces.
   We have no chance to compartmentalize the vulnerability inside of the CreditCardReader.
   
Comment:

This risk was accepted by project management on 2018-03-02.

Covers:

* `arch~ayb.machineapplication-uses-wombathttpclient~1`
